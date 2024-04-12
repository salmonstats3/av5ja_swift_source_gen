import { Expose, Transform, plainToInstance } from 'class-transformer'
import fetch from 'node-fetch'

import { Translation } from './translation'

export const LocaleKey = {
  CNzh: 'locale12',
  EUde: 'locale0',
  EUen: 'locale1',
  EUes: 'locale3',
  EUfr: 'locale6',
  EUit: 'locale7',
  EUnl: 'locale10',
  EUru: 'locale11',
  JPja: 'locale8',
  KRko: 'locale9',
  TWzh: 'locale13',
  USen: 'locale2',
  USes: 'locale4',
  USfr: 'locale5',
} as const

export const LocaleId = {
  CNzh: 153,
  EUde: 139,
  EUen: 495,
  EUes: 888,
  EUfr: 277,
  EUit: 448,
  EUnl: 286,
  EUru: 303,
  JPja: 31,
  KRko: 401,
  TWzh: 56,
  USen: 0,
  USes: 835,
  USfr: 479,
} as const

/**
 * Xcode用の翻訳Localeのprefixを返す
 * @param locale
 * @returns
 */
export const prefix_xcode = (locale: LocaleId): string => {
  switch (locale) {
    case LocaleId.EUde:
      return 'de'
    case LocaleId.EUen:
      return 'en-GB'
    case LocaleId.USen:
      return 'en'
    case LocaleId.EUes:
      return 'es'
    case LocaleId.USes:
      return 'es-MX'
    case LocaleId.USfr:
      return 'fr-CA'
    case LocaleId.EUfr:
      return 'fr'
    case LocaleId.EUit:
      return 'it'
    case LocaleId.JPja:
      return 'ja'
    case LocaleId.KRko:
      return 'ko'
    case LocaleId.EUnl:
      return 'nl'
    case LocaleId.EUru:
      return 'ru'
    case LocaleId.CNzh:
      return 'zh-Hans'
    case LocaleId.TWzh:
      return 'zh-Hant'
    default:
      throw new Error('Invalid Locale')
  }
}

export type LocaleId = (typeof LocaleId)[keyof typeof LocaleId]
export type LocaleKey = (typeof LocaleKey)[keyof typeof LocaleKey]

async function get_game_web_version_hash(): Promise<string> {
  const url = 'https://api.lp1.av5ja.srv.nintendo.net/'
  const re = new RegExp('main.([a-z0-9]{8}).js')

  const response: string = await (await fetch(url)).text()
  return re.test(response) ? re.exec(response)![1] : 'bd36a652'
}

async function get_locales(hash: string): Promise<LocaleType[]> {
  const base_url = `https://api.lp1.av5ja.srv.nintendo.net/static/js/main.${hash}.js`
  const response: string = await (await fetch(base_url)).text()

  const hashes = /([\d]{2,3}):"([a-f0-9]{8})"/g
  const results = [...response.matchAll(hashes)]
    .map((result) => {
      return {
        hash: result[2],
        id: result[1],
      }
    })
    .map((item) => plainToInstance(LocaleType, item, { excludeExtraneousValues: true }))
    .concat([plainToInstance(LocaleType, { hash: hash, id: 0 }, { excludeExtraneousValues: true })])
  return results
}

export class LocaleType {
  /**
   * 全パターン
   * @returns
   */
  static async all_cases(): Promise<LocaleType[]> {
    const hash: string = await get_game_web_version_hash()
    return await get_locales(hash)
  }

  /**
   * 翻訳クラスの取得
   * @returns
   */
  async get_translation(): Promise<Translation> {
    const locale: string = Object.keys(LocaleId)[Object.values(LocaleId).indexOf(this.id)]
    const url = `https://leanny.github.io/splat3/data/language/${locale}.json`
    const objects = {
      ...JSON.parse(await (await fetch(url)).text()),
      ...{ hash: this.hash, id: this.id, key: this.key, locale: this.locale, xcode: this.xcode },
    }
    return plainToInstance(Translation, objects, { excludeExtraneousValues: true })
  }

  /**
   * LocaleId
   */
  @Expose({ name: 'id' })
  @Transform(
    (param) => Object.values(LocaleId)[(Object.values(LocaleId) as number[]).indexOf(parseInt(param.value, 10))],
  )
  readonly id: LocaleId

  /**
   * Hash
   */
  @Expose({ name: 'hash' })
  hash: string

  /**
   * Key
   */
  get key(): LocaleKey {
    return Object.values(LocaleKey)[(Object.values(LocaleId) as number[]).indexOf(this.id)]
  }

  /**
   * 内部LocaleCode
   */
  get locale(): string {
    return Object.keys(LocaleId)[Object.values(LocaleId).indexOf(this.id)]
  }

  /**
   * Xcode用のLocaleCode
   */
  private get xcode(): string {
    return prefix_xcode(this.id)
  }

  /**
   * イカリング3のURL
   */
  get url(): string {
    return this.id === LocaleId.USen
      ? `https://api.lp1.av5ja.srv.nintendo.net/static/js/main.${this.hash}.js`
      : `https://api.lp1.av5ja.srv.nintendo.net/static/js/${this.locale}.${this.hash}.chunk.js`
  }
}
