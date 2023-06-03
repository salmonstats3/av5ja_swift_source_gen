// import { URLType, Version, request } from "./dto/urls"
import { plainToInstance } from "class-transformer";
import { EnumURLType } from "./dto/internal_type";
import { LocaleId } from "./dto/locale_type";
import { URLType, Version } from "./dto/urls";
import { OutputType, SwiftEnumWriter } from "./utils/enum";
import { get_web_revision, get_locale_bundles } from "./utils/revision";
import fetch from "node-fetch"; 
import { Translation } from "./dto/translation";

// イカリング3からデータを取得する
const response = await get_web_revision();
console.log(response);
await get_locale_bundles();

Object.values(URLType).forEach(async (url) => {
<<<<<<< HEAD
    const data: EnumURLType = await EnumURLType.from(url, Version.V400)
    const writer = new SwiftEnumWriter(data)
    Object.values(OutputType).forEach((type) => {
        writer.write(type)
    })
})
=======
  const data: EnumURLType = await EnumURLType.from(url, Version.V400);
  const writer = new SwiftEnumWriter(data);
  Object.values(OutputType).forEach((type) => {
    writer.write(type);
  });
});

Object.keys(LocaleId).forEach(async (locale: string) => {
    const url: string = `https://leanny.github.io/splat3/data/language/${locale}.json`
    const translation: Translation = plainToInstance(Translation, await (await fetch(url)).json(), { excludeExtraneousValues: true })
    translation.write(Object.values(LocaleId)[Object.keys(LocaleId).indexOf(locale)])
})
>>>>>>> 3fdc445 (rebase from master)
