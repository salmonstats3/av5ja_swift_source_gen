import { Expose, Transform } from 'class-transformer';
import 'reflect-metadata';
import { createFile } from '../utils/revision';
import { calc_hash } from './internal_type';
import dayjs from 'dayjs';
import { LocaleId, LocaleKey } from './locale_type';
import fetch, { Response } from 'node-fetch';
import camelcaseKeys from 'camelcase-keys';
import yaml from 'js-yaml';
import fs from 'fs';

/**
 * 翻訳, ソースコードを出力するクラス
 */
class TranslationType extends Map<string, string> {
  name: string;

  constructor(values: Map<string, string>, name: string) {
    super(Object.entries(values));
    this.name = name;
  }

  /**
   * ソースコード
   */
  get source(): string {
    const created_at: string = dayjs().format('YYYY/MM/DD');
    const created_year: string = dayjs().format('YYYY');
    const default_value: string = this.keys().next().value.replace(/_/g, '');
    let translations: string[] = [
      '//',
      `//  ${this.name}.swift`,
      '//',
      `//  Created by tkgstrator on ${created_at}`,
      `//  Copyright @${created_year} Magi, Corporation. All rights reserved.`,
      '//',
      '',
      'import Foundation',
      '',
      `public enum ${this.name}: String, UnsafeRawRepresentable {`,
      `    public static var defaultValue: Self = .${default_value}`,
      `    public var id: Int { ${this.name.slice(0, -3)}Id.allCases[${this.name}.allCases.firstIndex(of: self) ?? 0].rawValue }`,
      '',
    ];
    this
    .forEach((value, key) => {
      if (!/Arbeiter/.test(key)) {
        translations.push(`    /// ${value}`);
        translations.push(`    case ${key.replace(/_/g, '')} = "${calc_hash(key)}"`);
      }
    });
    translations.push('}');
    return translations.join('\n');
  }

  /**
   * 翻訳データ
   */
  get translations(): string {
    let translations: string[] = [];
    this.forEach((value, key) => {
      translations.push(`/// ${value}`);
      translations.push(`"${key.replace(/_/g, '')}" = "${value}";`);
    });
    return translations.join('\n');
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
  readonly locale: string;

  /**
   * Locale
   */
  @Expose({ name: 'xcode' })
  readonly xcode: string;

  /**
   * Hash
   */
  @Expose({ name: 'hash' })
  hash: string;

  /**
   * イカリング3のURL
   */
  get url(): string {
    return this.id === LocaleId.USen
      ? `https://api.lp1.av5ja.srv.nintendo.net/static/js/main.${this.hash}.js`
      : `https://api.lp1.av5ja.srv.nintendo.net/static/js/${this.key}.${this.hash}.chunk.js`;
  }

  /**
   * イカリング3からJSON文字列を取得する
   */
  private async get_context(): Promise<string> {
    const context: string = await (async (): Promise<string> => {
      const response: Response = await fetch(this.url);
      return response.text();
    })();
    const re = /JSON.parse\('(.*)'\)\}\}/;
    // マッチしなかったらエラーを返す
    if (!re.test(context)) throw new Error('This response does not contain any JSON format strings.');
    const match: RegExpMatchArray | null = context.match(re);
    if (match !== null && match.length !== 0) {
      return match[1]
        .replace(/\\x([0-9A-Fa-f]{2})/g, (_, p1) => String.fromCharCode(parseInt('0x00' + p1, 16)))
        .replace(/\\u([0-9A-Fa-f]{4})/g, (_, p1) => String.fromCharCode(parseInt('0x' + p1, 16)))
        .replace(/\\"/g, "'")
        .replace(/\\'/g, "'");
    } else {
      throw new Error('This response does not contain any JSON format strings.')
    }
  }

  /**
   * イカリング3からJSONを取得する
   */
  private async get_bundle(): Promise<[string, unknown][]> {
    // PascalCaseに変換
    const context = camelcaseKeys(JSON.parse(await this.get_context()), { pascalCase: true })
    // JSONを保存
    createFile(JSON.stringify(context, null, 2), `src/locales/${this.hash}/${this.key}.json`)
    const objects = Object.fromEntries(Object.entries(context)
      .filter(
        ([key, value]) =>
          (key.match(/^Common/) ||
            key.match(/^CoopHistory/) ||
            key.match(/^Error/) ||
            key.match(/^Record/) ||
            key.match(/^Settings/) ||
            key.match(/^StageSchedule/)) &&
          !key.includes('%') &&
          !(value as string).match(/<|>/) &&
          !key.match(/Fes/),
      )
      .map(([key, value]) => [
        key,
        (value as string)
          .trim()
          .replace(/{.*}|^'|'$/g, '')
          .trim()
          .replace(/：|:^/g, ''),
      ])
      .filter(([_, value]) => value.length >= 2))
    // YAMLを保存
    createFile(yaml.dump(objects), `src/locales/${this.hash}/${this.key}.yaml`)
    return Object.entries(objects)
  }

  /**
   * ソースコードと翻訳ファイルを出力する
   */
  async write(): Promise<void> {
    if (this.id === LocaleId.JPja) {
      // キーファイルの作成
      [this.CoopStageName, this.CoopGrade].forEach((translation: TranslationType) => {
        createFile(translation.source, `sources/Keys/${translation.name}.swift`);
      });
    }

    const objects: [string, unknown][] = (await this.get_bundle()).concat(this.get_yaml());
    // 翻訳ファイルの作成
    const translation: string = [this.CoopEnemy, this.CoopGrade, this.CoopSkinName, this.CoopStageName]
      .map((translation: TranslationType) => translation.translations)
      .concat(objects.map(([key, value]) => [
        `/// ${value}`,
        `"${key}" = "${value}";`,
      ].join('\n')))
      .join('\n');
    createFile(translation, `sources/Resources/${this.xcode}.lproj/Localizable.strings`);

    if (this.id === LocaleId.JPja) {
      const source: string = this.get_source(objects);
      createFile(source, 'sources/LocalizedType.swift');
    }
  }

  /**
   * YAMLから翻訳データを読み込む
   * @returns 
   */
  private get_yaml(): [string, unknown][] {
    const data = JSON.parse(JSON.stringify(yaml.load(fs.readFileSync(`resources/default.yaml`, 'utf8'))))
    return Object.entries(data).map(([key, values]) => {
      const value: string | undefined = Object.entries(values as object).find(([key, _]) => key === this.xcode)?.[1] as string | undefined
      return [key, value] 
    })
  }

  private get_source(objects: object): string {
    const created_at: string = dayjs().format('YYYY/MM/DD');
    const created_year: string = dayjs().format('YYYY');
    let translations: string[] = [
      '//',
      `//  LocalizedType.swift`,
      '//',
      `//  Created by tkgstrator on ${created_at}`,
      `//  Copyright @${created_year} Magi, Corporation. All rights reserved.`,
      '//',
      '',
      'import Foundation',
      '',
      `public enum LocalizedType: String, CaseIterable, Identifiable {`,
      `    public var id: String { rawValue }`, 
      '',
    ];

    Object.values(objects).sort().forEach(([key, value]) => {
      translations.push(`    /// ${value}`);
      translations.push(`    case ${key}`);
    });
    translations.push('}');
    return translations.join('\n');
  }
}
