import { Expose, Transform } from 'class-transformer';

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
} as const;

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
} as const;

/**
 * Xcode用の翻訳Localeのprefixを返す
 * @param locale
 * @returns
 */
export const prefix_xcode = (locale: LocaleId): string => {
  switch (locale) {
    case LocaleId.EUde:
      return 'de';
    case LocaleId.EUen:
      return 'en';
    case LocaleId.USen:
      return 'en-US';
    case LocaleId.EUes:
      return 'es';
    case LocaleId.USes:
      return 'es-US';
    case LocaleId.USfr:
      return 'fr-US';
    case LocaleId.EUfr:
      return 'fr';
    case LocaleId.EUit:
      return 'it';
    case LocaleId.JPja:
      return 'ja';
    case LocaleId.KRko:
      return 'ko';
    case LocaleId.EUnl:
      return 'nl';
    case LocaleId.EUru:
      return 'ru';
    case LocaleId.CNzh:
      return 'zh-Hans';
    case LocaleId.TWzh:
      return 'zh-Hant';
    default:
      throw new Error('Invalid Locale');
  }
};

export type LocaleId = (typeof LocaleId)[keyof typeof LocaleId];
export type LocaleKey = (typeof LocaleKey)[keyof typeof LocaleKey];

export class LocaleType {
  @Expose({ name: 'id' })
  @Transform((param) => Object.values(LocaleId)[(Object.values(LocaleId) as number[]).indexOf(parseInt(param.value, 10))])
  readonly id: LocaleId;

  @Expose({ name: 'hash' })
  readonly hash: string;

  @Expose({ name: 'locale' })
  get locale(): LocaleKey {
    return Object.values(LocaleKey)[(Object.values(LocaleId) as number[]).indexOf(this.id)];
  }

  get xcode(): string {
    return prefix_xcode(this.id);
  }

  get url(): string {
    return this.id === LocaleId.USen
      ? `https://api.lp1.av5ja.srv.nintendo.net/static/js/main.${this.hash}.js`
      : `https://api.lp1.av5ja.srv.nintendo.net/static/js/${this.locale}.${this.hash}.chunk.js`;
  }
}
