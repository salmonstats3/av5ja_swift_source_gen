# from threading import local
from locales import *
from nameplate import *
from badge import *
from content import *
from weapons import *
import requests
import json
import base64
import hashlib
import os
import re

# Ignore .DS_Store
def listdir(path: str) -> list[str]:
    return [filename for filename in os.listdir(path) if not filename.startswith('.')]

def get_merged_json(locale: str) -> json:
    # JSONをマージして読み込み
    revisions = listdir("resources")
    print(revisions)
    locales = list(
        map(lambda x: json.load(open(f"resources/{x}/{locale}.json")), revisions)
    )
    output = {}
    for locale in locales:
        output.update(locale)
    return output


def get_base64(plain: str) -> str:
    return base64.b64encode(plain.encode())


def get_hash(plain: str) -> str:
    return hashlib.sha256(plain.encode()).hexdigest()


def format(key: str, value: str) -> str:
    key = key.replace("_%", "").replace("-", "_").replace("_", "").strip()
    value = value.replace('"', "")
    value = value.replace("\n", "")
    value = value.replace("_", "")
    return f'"{key.strip()}" = "{value.strip()}";\n'


def plain(key: str, value: str) -> str:
    key = key.replace("_%", "").replace("-", "_").replace("_", "").strip()
    value = value.replace('"', "")
    value = value.replace("\n", "")
    value = value.replace("_", "")
    return f'"{key.strip()}" = "{value.strip()}";\n'


def localized_format(key: str, value: str) -> str:
    key = key.replace("_%", "").replace("-", "_").replace("_", "").strip()
    value = value.replace("\n", "")
    value = value.replace('"', "")
    value = value.replace("_", "")
    return f'\t/// {value}\n\tcase {key} = "{key}"\n'


def get_locales() -> list[Locale]:
    with open("locales.json", mode="r") as f:
        return list(
            map(lambda locale: Locale.from_json(json.dumps(locale)), json.load(f))
        )


def camel_case(dict):
    keys = dict.copy().keys()
    for key in keys:
        # print(key)
        value = dict[key]
        del dict[key]
        camel_key = re.sub("_(.)", lambda x: x.group(1).upper(), key)
        camel_key = re.sub("\.(.)", lambda x: f"_{x.group(1).upper()}", camel_key)
        camel_key = camel_key.replace("_", "")
        camel_key = camel_key.replace("%", "")
        if 'WidgetsStagesYearDatetimeFormat' == camel_key:
            dict['DatetimeYearFormat'] = value
        if 'WidgetsStagesDatetimeFormat' == camel_key:
            dict['DatetimeFormat'] = value
        if 'Coop' == camel_key[0:4] or 'Common' in camel_key[0:6] or 'Record' in camel_key[0:6]:
            dict[camel_key] = value
    return dict


def tuple_to_dict(tuple) -> dict:
    dict = {}
    for k, v in tuple:
        dict[k] = v
    return dict


def get_revision() -> str:
    # Revisionを取得
    url = "https://api.lp1.av5ja.srv.nintendo.net/?lang=ja-JP"
    response = requests.get(url)
    response.encoding = response.apparent_encoding
    revision = re.search(
        'src="/static/js/main\.([a-f0-9]{8}).js"', response.text
    ).group(1)
    print("Revision:", revision)
    return revision


def get_localized(revision):
    # JavaScriptからlocaleとhashを取得
    base_url = f"https://api.lp1.av5ja.srv.nintendo.net/static/js/main.{revision}.js"
    response = requests.get(base_url).text
    locales = tuple_to_dict(re.findall('([\d]{2,3}):"(locale[\d]{1,2})"', response))
    hashes = tuple_to_dict(re.findall('([\d]{2,3}):"([a-f0-9]{8})"', response))

    # Internal codeを取得
    codes = re.findall('"./([a-z]{2}-[A-Z]{2}).json":\[(.*?)\]', response)
    codes = tuple_to_dict(list(map(lambda x: (x[1].split(",")[-1], x[0]), codes)))

    # イカリング3から言語データのマップを作成
    data: list[Locale] = get_locales()
    languages = {}
    for key in hashes.keys():
        lang: Locale = list(filter(lambda x: x.locale == locales[key], data))[0]
        languages[key] = {
            "locale": locales[key],
            "hash": hashes[key],
            "code": codes[key],
            "xcode": lang.xcode,
            "internal": lang.internal_code,
            "event_type": lang.event_waves,
            "king_sakelien": lang.king_sakelien,
        }
    # 英語を追加
    lang: Locale = list(filter(lambda x: x.locale == "locale99", data))[0]
    languages[65468] = {
        "locale": "locale14",
        "hash": None,
        "code": "en-US",
        "xcode": lang.xcode,
        "internal": lang.internal_code,
        "event_type": lang.event_waves,
        "king_sakelien": lang.king_sakelien,
    }

    languages: list[Language] = list(map(lambda v: Language(**v), languages.values()))
    deep = json.load(open("output.json", mode="r"))

    for language in languages:
        # 内部データから検索
        print(f"Downloading {language.xcode}")
        url = f"https://leanny.github.io/splat3/data/language/{language.internal}.json"
        params = []
        localized = []

        res: dict = requests.get(url).json()

        data = res["CommonMsg/Coop/CoopEnemy"]
        for k, v in data.items():
            k = f"CoopEnemy{k}"
            params.append(format(k, v))
            localized.append(localized_format(k, v))

        data = res["CommonMsg/Coop/CoopGrade"]
        for k, v in data.items():
            k = k.replace("Grade", "CoopGrade")
            params.append(format(k, v))
            localized.append(localized_format(k, v))

        # data = res["CommonMsg/Coop/CoopSkinName"]
        # for k, v in data.items():
        #     params.append(format(k, v))

        data = res["CommonMsg/Coop/CoopStageName"]
        for k, v in data.items():
            k = f"CoopStage{k}"
            params.append(format(k, v))
            localized.append(localized_format(k, v))

        # data = res["CommonMsg/Weapon/WeaponName_Main"]
        # for k, v in data.items():
        #     if "_00" in k and "Rival" not in k:
        #         params.append(format(k, v))
        #         localized.append(localized_format(k, v))
        #     elif "Bear_Coop" in k:
        #         params.append(format(k, v))
        #         localized.append(localized_format(k, v))

        # data = res["CommonMsg/Weapon/WeaponName_Special"]
        # for k, v in data.items():
        #     if "_Coop" in k:
        #         params.append(format(k, v))
        #         localized.append(localized_format(k, v))

        # data = res["LayoutMsg/Cmn_Menu_00"]
        # for k, v in data.items():
        #     if "L_" in k:
        #         params.append(format(k, v))
        #         localized.append(localized_format(k, v))
        #     elif "T_" in k:
        #         params.append(format(k, v))
        #         localized.append(localized_format(k, v))

        # data = res["LayoutMsg/Lobby_MenuMode_00"]
        # for k, v in data.items():
        #     if "L_" in k:
        #         params.append(format(k, v))
        #         localized.append(localized_format(k, v))
        #     elif "T_" in k:
        #         params.append(format(k, v))
        #         localized.append(localized_format(k, v))

        # data = res["LayoutMsg/Plz_ItemMenu_00"]
        # for k, v in data.items():
        #     if "L_" in k:
        #         params.append(format(k, v))
        #         localized.append(localized_format(k, v))
        #     elif "T_" in k:
        #         params.append(format(k, v))
        #         localized.append(localized_format(k, v))

        # data = res["CommonMsg/Weapon/WeaponParamName"]
        # for k, v in data.items():
        #     params.append(format(k, v))
        #     localized.append(localized_format(k, v))

        # data = res["CommonMsg/Byname/BynameAdjective"]
        # for k, v in data.items():
        #     v = "".join(re.findall("([^\[\]]+(?=\[[^\[\]]+\])|[^\[\]]+$)", v))
        #     if len(v) != 0:
        #         params.append(format(k, v))

        # data = res["CommonMsg/Byname/BynameSubject"]
        # for k, v in data.items():
        #     v = "".join(re.findall("([^\[\]]+(?=\[[^\[\]]+\])|[^\[\]]+$)", v))
        #     if len(v) != 0:
        #         params.append(format(k, v))

        # data = res["CommonMsg/Manual/ManualCoop"]
        # for k, v in data.items():
        #     if re.search(r"T_TitleCoop_\d{2}", k) is not None:
        #         v = v.split()[1]
        #         params.append(format(k, v))
        #         localized.append(localized_format(k, v))
        # k = "T_TitleCoop_45"
        # v = "-"
        # params.append(format(k, v))
        # localized.append(localized_format(k, v))

        # フォントデータを追加
        if language.locale == "locale12":
            localized.append(localized_format("CommonLocaleLang", "1"))
            params.append(format("CommonLocaleLang", "1"))
        elif language.locale == "locale13":
            localized.append(localized_format("CommonLocaleLang", "2"))
            params.append(format("CommonLocaleLang", "2"))
        else:
            localized.append(localized_format("CommonLocaleLang", "0"))
            params.append(format("CommonLocaleLang", "0"))

        # フォントデータを追加
        localized.append(localized_format("CommonSplatNet3Locale", language.code))
        params.append(format("CommonSplatNet3Locale", language.code))

        # DeepL翻訳データを変換
        try:
            for k, v in deep[language.code].items():
                params.append(format(k, v))
                localized.append(localized_format(k, v))
        except:
            for k, v in deep["en-US"].items():
                params.append(format(k, v))
                localized.append(localized_format(k, v))

        # イカリング3からデータ取得
        if language.code == "en-US":
            url = f"https://api.lp1.av5ja.srv.nintendo.net/static/js/main.{revision}.js"
        else:
            url = f"https://api.lp1.av5ja.srv.nintendo.net/static/js/{language.locale}.{language.hash}.chunk.js"
        # JavaScriptの中身
        response = requests.get(url).text

        # JSONを取り出す
        match = re.search("JSON.parse\('(.*)'\)\}\}", response).group(1)
        # UTF8でデコード
        data = json.loads(match.encode("utf-8").decode("unicode-escape"))
        # ディレクトリがなければ作成
        makdirs(f"resources/{revision}")
        # ファイルを保存
        with open(f"resources/{revision}/{language.locale}.json", mode="w") as w:
            w.write(json.dumps(data, indent=2, ensure_ascii=False))

        # SplatNet3形式をキャメルケースに変換
        data = camel_case(get_merged_json(language.locale))
        for k, v in data.items():
            if "CoopHistoryWaveLevel" in k:
                k = k.replace("CoopHistoryWaveLevel", "CoopWaterLevel")
                params.append(format(k, v))
                localized.append(localized_format(k, v))
            elif k == "CoopHistoryWave":
                value = v.split(" ")[0]
                params.append(format("CoopWave1", f"{value} 1"))
                params.append(format("CoopWave2", f"{value} 2"))
                params.append(format("CoopWave3", f"{value} 3"))
                localized.append(localized_format("CoopWave1", f"{value} 1"))
                localized.append(localized_format("CoopWave2", f"{value} 2"))
                localized.append(localized_format("CoopWave3", f"{value} 3"))
            else:
                params.append(format(k, v))
                localized.append(localized_format(k, v))

        # イベント情報を取得
        for index, wave in enumerate(language.event_type):
            params.append(format(f"CoopEvent{index+1}", wave))
            localized.append(localized_format(f"CoopEvent{index+1}", wave))

        if language.code == "ja-JP":
            get_localized_text(localized)
        # ディレクトリ作成
        makdirs(f"../SplatNet3/Sources/SplatNet3/Resources/{language.xcode}.lproj")
        # 翻訳ファイルを書き込み
        with open(
            f"../SplatNet3/Sources/SplatNet3/Resources/{language.xcode}.lproj/Localizable.strings",
            mode="w",
        ) as f:
            print(f"Converting {language.xcode}")
            f.writelines(sorted(params))


def get_localized_text(localized: list[str]):
    makdirs(f"../SplatNet3/Sources/SplatNet3/Enum/")
    with open(f"../SplatNet3/Sources/SplatNet3/Enum/LocalizedType.swift", mode="w") as f:
        headers = [
            "//\n",
            "//  LocalizedType.swift\n",
            "//  SplatNet3\n",
            "//\n",
            "//  Created by tkgstrator on 2022/09/22\n",
            "//  Copyright © 2022 Magi, Corporation. All rights reserved.\n",
            "//\n",
            "\n\n",
            "import Foundation\n\n",
            "public enum LocalizedType: String, CaseIterable {\n",
            '\tpublic var localized: String { NSLocalizedString(rawValue, bundle: .module, comment: "") }\n',
        ]
        f.writelines(headers)
        # hashes = sorted(hashes, key=lambda tup: tup[1].capitalize())
        for line in localized:
            f.write(line)
        f.write("}")


def get_weapons(version: str):
    url = f"https://leanny.github.io/splat3/data/mush/{version}/WeaponInfoMain.json"
    response = requests.get(url).text.replace("__RowId", "RowId")
    weapons: list[WeaponElement] = list(
        map(
            lambda weapon: WeaponElement.from_json(json.dumps(weapon)),
            json.loads(response),
        )
    )
    # for weapon in weapons:
    #     if (
    #         "_00" in weapon.RowId
    #         and "Rival" not in weapon.RowId
    #         and "Mission" not in weapon.RowId
    #     ):
    #         url = f"https://leanny.github.io/splat3/images/weapon_flat/Path_Wst_{weapon.RowId}.png"
    #         print(url)

    #         makdirs(
    #             f"../SplatNet3/Sources/SplatNet3/Assets.xcassets/Weapons/{weapon.Id}.imageset"
    #         )
    #         with open(
    #             f"../SplatNet3/Sources/SplatNet3/Assets.xcassets/Weapons/{weapon.Id}.imageset/{weapon.RowId}.png",
    #             mode="wb",
    #         ) as f:
    #             f.write(requests.get(url).content)

    #         with open(
    #             f"../SplatNet3/Sources/SplatNet3/Assets.xcassets/Weapons/{weapon.Id}.imageset/Contents.json",
    #             mode="w",
    #         ) as f:
    #             content = to_dict(Content(f"{weapon.RowId}"))
    #             f.write(json.dumps(content))


def get_hashes(revision):
    url = f"https://api.lp1.av5ja.srv.nintendo.net/static/js/main.{revision}.js"
    response = requests.get(url).text
    # Hash
    hashes = re.findall('id:"([a-f0-9]{32})",metadata:{},name:"([A-z]*)"', response)
    makdirs(f"../SplatNet3/Sources/SplatNet3/Enum/")
    with open(f"../SplatNet3/Sources/SplatNet3/Enum/SHA256Hash.swift", mode="w") as f:
        headers = [
            "//\n",
            "//  SHA256Hash.swift\n",
            "//  SplatNet3\n",
            "//\n",
            "//  Created by tkgstrator on 2022/09/22\n",
            "//  Copyright © 2022 Magi, Corporation. All rights reserved.\n",
            "//\n\n",
            "import Foundation\n\n",
            "public enum SHA256Hash: String, CaseIterable {\n",
        ]
        f.writelines(headers)
        hashes = sorted(hashes, key=lambda tup: tup[1].capitalize())
        for hash in hashes:
            key = hash[1][0].upper() + hash[1][1:]
            value = hash[0]
            f.write(f'\tcase {key} = "{value}"\n')
        f.write("}")
        f.close()

        for hash in hashes:
            # Key + Value
            key = hash[1][0].upper() + hash[1][1:]
            value = hash[0]
            # Write Files
            try:
                with open(
                    f"../Sources/SplatNet3/Requests/SplatNet3/{key}.swift", mode="x"
                ) as fw:
                    headers = [
                        f"//\n",
                        f"//  {key}.swift\n",
                        f"//  SplatNet3\n",
                        f"//\n",
                        f"//  Created by tkgstrator on 2022/09/22\n",
                        f"//  Copyright © 2022 Magi, Corporation. All rights reserved.\n",
                        f"//\n",
                        f"\n\n",
                        f"import Foundation\n",
                        f"import Alamofire\n\n",
                        f"final class {key}: GraphQL" + " {\n",
                        f"\tpublic typealias ResponseType = {key}.Response\n",
                        f"\tvar hash: SHA256Hash = .{key}\n",
                        f"\tvar variables: [String: String] = [:]\n",
                        f"\tvar parameters: Parameters?\n",
                        f"\n",
                        "\tinit() {}\n\n",
                        "\tpublic struct Response: Codable {\n",
                        "\t}\n",
                        "}\n",
                    ]
                    fw.writelines(headers)
                    fw.close()
            except:
                pass


def get_badge(version: str = "111"):
    url = f"https://leanny.github.io/splat3//data/mush/{version}/BadgeInfo.json"
    # そのままだと読み込めないので置換する
    response = (
        requests.get(url)
        .text.replace("__RowId", "RowId")
        .replace("Sub1_", "Sub1")
        .replace("Sub2_", "Sub2")
    )
    badges = list(
        map(
            lambda nameplate: BadgeElement.from_json(json.dumps(nameplate)),
            json.loads(response),
        )
    )

    makdirs(f"../SplatNet3/Sources/SplatNet3/Enum/Ids")
    with open(f"../SplatNet3/Sources/SplatNet3/Enum/Ids/BadgeInfoId.swift", mode="w") as f:
        headers = [
            "//\n",
            "//  BadgeInfoId.swift\n",
            "//  SplatNet3\n",
            "//\n",
            "//  Created by tkgstrator on 2022/09/22\n",
            "//  Copyright © 2022 Magi, Corporation. All rights reserved.\n",
            "//\n\n",
            "import Foundation\n\n",
            "public enum BadgeInfoId: Int, UnsafeRawRepresentable {\n",
            "\tpublic var id: Int { rawValue }\n",
            "\tpublic static var defaultValue: Self = .CatalogueLevel_Lv00\n",
        ]
        f.writelines(headers)
        for badge in badges:
            f.write(f"\tcase {badge.Name} = {badge.Id}\n")
        f.write("}")
        
    makdirs(f"../SplatNet3/Sources/SplatNet3/Enum/Keys")
    with open(f"../SplatNet3/Sources/SplatNet3/Enum/Keys/BadgeInfoKey.swift", mode="w") as f:
        headers = [
            "//\n",
            "//  BadgeInfoKey.swift\n",
            "//  SplatNet3\n",
            "//\n",
            "//  Created by tkgstrator on 2022/09/22\n",
            "//  Copyright © 2022 Magi, Corporation. All rights reserved.\n",
            "//\n\n",
            "import Foundation\n\n",
            "public enum BadgeInfoKey: String, UnsafeRawRepresentable {\n",
            "\tpublic var id: String { rawValue }\n",
            "\tpublic static var defaultValue: Self = .CatalogueLevel_Lv00\n",
        ]
        f.writelines(headers)
        for badge in badges:
            f.write(f'\tcase {badge.Name} = "{get_hash(badge.Name)}"\n')
        f.write("}")


def get_nameplate(version: str = "111"):
    url = f"https://leanny.github.io/splat3//data/mush/{version}/NamePlateBgInfo.json"
    # そのままだと読み込めないので置換する
    response = requests.get(url).text.replace("__RowId", "RowId")
    nameplates = list(
        map(
            lambda nameplate: NamePlateBgElement.from_json(json.dumps(nameplate)),
            json.loads(response),
        )
    )

    makdirs(f"../SplatNet3/Sources/SplatNet3/Enum/Ids")
    with open(f"../SplatNet3/Sources/SplatNet3/Enum/Ids/NamePlateBgInfoId.swift", mode="w") as f:
        headers = [
            "//\n",
            "//  NamePlageBgInfoId.swift\n",
            "//  SplatNet3\n",
            "//\n",
            "//  Created by tkgstrator on 2022/09/22\n",
            "//  Copyright © 2022 Magi, Corporation. All rights reserved.\n",
            "//\n\n",
            "import Foundation\n\n",
            "public enum NamePlateBgInfoId: Int, UnsafeRawRepresentable {\n",
            "\tpublic var id: Int { rawValue }\n",
            "\tpublic static var defaultValue: Self = .Npl_Tutorial00\n",
        ]
        f.writelines(headers)
        for nameplate in nameplates:
            f.write(f"\tcase {nameplate.RowId} = {nameplate.Id}\n")
        f.write("}")
        
    makdirs(f"../SplatNet3/Sources/SplatNet3/Enum/Keys")
    with open(f"../SplatNet3/Sources/SplatNet3/Enum/Keys/NamePlateBgInfoKey.swift", mode="w") as f:
        headers = [
            "//\n",
            "//  NamePlateBgInfoKey.swift\n",
            "//  SplatNet3\n",
            "//\n",
            "//  Created by tkgstrator on 2022/09/22\n",
            "//  Copyright © 2022 Magi, Corporation. All rights reserved.\n",
            "//\n",
            "\n\n",
            "import Foundation\n\n",
            "public enum NamePlateBgInfoKey: String, UnsafeRawRepresentable {\n",
            "\tpublic var id: String { rawValue }\n",
            "\tpublic static var defaultValue: Self = .Npl_Tutorial00\n",
        ]
        f.writelines(headers)
        for nameplate in nameplates:
            f.write(f'\tcase {nameplate.RowId} = "{get_hash(nameplate.RowId)}"\n')
        f.write("}")


def makdirs(path: str):
    if os.path.exists(path) == False:
        os.makedirs(path)


def to_dict(obj):
    return json.loads(json.dumps(obj, default=lambda o: o.__dict__))


if __name__ == "__main__":
    revision = get_revision()
    print(revision)
    # 翻訳ファイル
    get_localized(revision)
    # ハッシュ
    get_hashes(revision)
    # ブキ
    get_weapons("400")
    # バッジ
    get_badge("400")
    # ネームプレート
    get_nameplate("400")
