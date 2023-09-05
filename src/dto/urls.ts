import { plainToInstance } from 'class-transformer';
import fetch from 'node-fetch';

import {
  BadgeInfo,
  CoopEnemyInfo,
  CoopSkinInfo,
  GearInfo,
  InternalType,
  NamePlateBgInfo,
  WeaponInfoMain,
  WeaponInfoSpecial,
} from './internal_type';

const base_url = (version: Version): string => {
  return `https://leanny.github.io/splat3/data/mush/${version}/`;
};

export const Version = {
  V0: '099',
  V100: '100',
  V110: '110',
  V111: '111',
  V120: '120',
  V200: '200',
  V210: '210',
  V300: '300',
  V310: '310',
  V400: '400',
} as const;

export const URLType = {
  BadgeInfo: 'BadgeInfo.json',

  CoopEnemyInfo: 'CoopEnemyInfo.json',

  CoopSkinInfo: 'CoopSkinInfo.json',

  GearInfoClothes: 'GearInfoClothes.json',

  GearInfoHead: 'GearInfoHead.json',

  GearInfoShoes: 'GearInfoShoes.json',

  NamePlateBgInfo: 'NamePlateBgInfo.json',

  WeaponInfoMain: 'WeaponInfoMain.json',
  // WeaponInfoSub: "WeaponInfoSub.json",
  WeaponInfoSpecial: 'WeaponInfoSpecial.json',
} as const;

export async function request(url: URLType, version: Version): Promise<InternalType[]> {
  const target_url: string = base_url(version) + url;
  const response: any[] = (await (await fetch(target_url)).json()) as any[];
  switch (url) {
    case URLType.WeaponInfoMain:
      return [WeaponInfoMain.Dummy, WeaponInfoMain.Random_Gold, WeaponInfoMain.Random_Green]
        .concat(
          response
            .map((item: any) =>
              plainToInstance(WeaponInfoMain, item, {
                excludeExtraneousValues: true,
              }),
            )
            .filter((item: WeaponInfoMain) => item.for_coop),
        )
        .sort((a, b) => a.id - b.id);
    // case URLType.WeaponInfoSub:
    //   return response
    //     .map((item: any) => plainToInstance(WeaponInfoMain, item, { excludeExtraneousValues: true }))
    //     .sort((a, b) => a.id - b.id);
    case URLType.WeaponInfoSpecial:
      return [WeaponInfoSpecial.Random_Green]
        .concat(
          response
            .map((item: any) => plainToInstance(WeaponInfoSpecial, item, { excludeExtraneousValues: true }))
            .filter((item: WeaponInfoSpecial) => item.for_coop),
        )
        .sort((a, b) => a.id - b.id);
    case URLType.GearInfoHead:
      return response
        .map((item: any) => plainToInstance(GearInfo, item, { excludeExtraneousValues: true }))
        .sort((a, b) => a.id - b.id);
    case URLType.GearInfoClothes:
      return response
        .map((item: any) => plainToInstance(GearInfo, item, { excludeExtraneousValues: true }))
        .sort((a, b) => a.id - b.id);
    case URLType.GearInfoShoes:
      return response
        .map((item: any) => plainToInstance(GearInfo, item, { excludeExtraneousValues: true }))
        .sort((a, b) => a.id - b.id);
    case URLType.CoopSkinInfo:
      return response
        .map((item: any) => plainToInstance(CoopSkinInfo, item, { excludeExtraneousValues: true }))
        .sort((a, b) => a.id - b.id);
    case URLType.CoopEnemyInfo:
      return response
        .map((item: any) =>
          plainToInstance(CoopEnemyInfo, item, {
            excludeExtraneousValues: true,
          }),
        )
        .filter((item) => item.id !== -1)
        .sort((a, b) => a.id - b.id);
    case URLType.BadgeInfo:
      return response
        .map((item: any) => plainToInstance(BadgeInfo, item, { excludeExtraneousValues: true }))
        .sort((a, b) => a.id - b.id);
    case URLType.NamePlateBgInfo:
      return response
        .map((item: any) =>
          plainToInstance(NamePlateBgInfo, item, {
            excludeExtraneousValues: true,
          }),
        )
        .sort((a, b) => a.id - b.id);
    default:
      throw new Error('Invalid URLType');
  }
}

export type URLType = (typeof URLType)[keyof typeof URLType];
export type Version = (typeof Version)[keyof typeof Version];
