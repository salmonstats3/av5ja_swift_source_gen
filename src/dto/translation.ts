import { Expose, Transform } from "class-transformer";
import "reflect-metadata";
import { createFile } from "../utils/revision";
import { calc_hash } from "./internal_type";
import dayjs from "dayjs";
import { LocaleId, LocaleKey, prefix_xcode } from "./locale_type";

/**
 * 翻訳, ソースコードを出力するクラス
 */
class TranslationType extends Map<string, string> {
  name: string

  constructor(values: Map<string, string>, name: string) {
    super(Object.entries(values))
    this.name = name
  }

  /**
   * ソースコード
   */
  get source(): string {
    const created_at: string = dayjs().format("YYYY/MM/DD");
    const created_year: string = dayjs().format("YYYY");
    const default_value: string = this.keys().next().value.replace(/_/g, '')
    let translations: string[] = [
      "//",
      `//  ${this.name}.swift`,
      "//",
      `//  Created by tkgstrator on ${created_at}`,
      `//  Copyright @${created_year} Magi, Corporation. All rights reserved.`,
      "//",
      "",
      "import Foundation",
      "",
      `public enum ${this.name}: String, UnsafeRawRepresentable {`,
      `    public static var defaultValue: Self = .${default_value}`,
      `    public var id: Int { ${this.name.slice(0,-3)}Id.allCases[${this.name}.allCases.firstIndex(of: self) ?? 0].rawValue }`,
      "",
    ];
    
    this.forEach((value, key) => {
      translations.push(`    /// ${value}`) 
      translations.push(`    case ${key.replace(/_/g, '')} = "${calc_hash(key)}"`)
    })
    translations.push("}") 
    return translations.join("\n")
  }

  /**
   * 翻訳データ
   */
  get translations(): string {
    let translations: string[] = []
    this.forEach((value, key) => {
      translations.push(`// ${value}`) 
      translations.push(`"${key.replace(/_/g, '')}" = "${value}";`)
    })
    return translations.join("\n")
  }
}

/**
 * 翻訳, ソースコード出力クラス
 */
export class Translation {
  @Expose({ name: 'CommonMsg/Coop/CoopEnemy' })
  @Transform((param) => new TranslationType(param.value, 'CoopEnemyKey'))
  readonly CoopEnemy: TranslationType;

  @Expose({ name: 'CommonMsg/Coop/CoopGrade' })
  @Transform((param) => new TranslationType(param.value, 'CoopGradeKey'))
  readonly CoopGrade: TranslationType;

  @Expose({ name: 'CommonMsg/Coop/CoopSkinName' })
  @Transform((param) => new TranslationType(param.value, 'CoopSkinInfoKey'))
  readonly CoopSkinName: TranslationType;

  @Expose({ name: 'CommonMsg/Coop/CoopStageName' })
  @Transform((param) => new TranslationType(param.value, 'CoopStageKey'))
  readonly CoopStageName: TranslationType;

  /**
   * ID
   */
  @Expose({ name: 'id' })
  readonly id: LocaleId;

  /**
   * キー
   */
  @Expose({ name: 'key' })
  readonly key: LocaleKey;

  /**
   * Locale
   */
  @Expose({ name: 'locale' })
  readonly locale: string 
  
  /**
   * Locale
   */
  @Expose({ name: 'xcode' })
  readonly xcode: string 

  /**
   * ソースコードと翻訳ファイルを出力する
   * @param locale
   */
  async write(locale: LocaleId): Promise<void> {
    if (locale === LocaleId.JPja) {
      // キーファイルの作成
      [this.CoopStageName, this.CoopGrade].forEach((translation: TranslationType) => {
        createFile(translation.source, `sources/Keys/${translation.name}.swift`);
      });
    }

    // イカリング3から翻訳ファイルを取得

    // 翻訳ファイルの作成
    const translation: string = [this.CoopEnemy, this.CoopGrade, this.CoopSkinName, this.CoopStageName]
      .map((translation: TranslationType) => translation.translations)
      .join('\n');
    createFile(translation, `sources/Resources/${prefix_xcode(locale)}.lproj/Internal.strings`);
  }
}