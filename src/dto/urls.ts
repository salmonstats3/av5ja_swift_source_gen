import fetch from "node-fetch";
import { BadgeInfo, CoopEnemyInfo, CoopSkinInfo, GearInfo, InternalType, NamePlateBgInfo, WeaponInfo } from "./internal_type";
import { plainToInstance } from "class-transformer";

const base_url = (version: Version): string => {
  return `https://leanny.github.io/splat3/data/mush/${version}/`;
};

export const Version = {
  V0: "099",
  V100: "100",
  V110: "110",
  V111: "111",
  V120: "120",
  V200: "200",
  V210: "210",
  V300: "300",
  V310: "310",
  V400: "400",
} as const;

export const URLType = {
  WeaponInfoMain: "WeaponInfoMain.json",
  WeaponInfoSub: "WeaponInfoSub.json",
  WeaponInfoSpecial: "WeaponInfoSub.json",
  GearInfoHead: "GearInfoHead.json",
  GearInfoClothes: "GearInfoClothes.json",
  GearInfoShoes: "GearInfoShoes.json",
  NamePlateBgInfo: "NamePlateBgInfo.json",
  BadgeInfo: "BadgeInfo.json",
  CoopSkinInfo: "CoopSkinInfo.json",
  CoopEnemyInfo: "CoopEnemyInfo.json",
} as const;

export async function request(
  url: URLType,
  version: Version
): Promise<InternalType[]> {
  const target_url: string = base_url(version) + url;
  const response: any[] = (await (await fetch(target_url)).json()) as any[];
  switch (url) {
    case URLType.WeaponInfoMain:
      return response.map((item: any) => plainToInstance(WeaponInfo, item, { excludeExtraneousValues: true })).filter((item: WeaponInfo) => item.for_coop);
    case URLType.WeaponInfoSub:
      return response.map((item: any) => plainToInstance(WeaponInfo, item, { excludeExtraneousValues: true }));
    case URLType.WeaponInfoSpecial:
      return response.map((item: any) => plainToInstance(WeaponInfo, item, { excludeExtraneousValues: true }));
    case URLType.GearInfoHead:
      return response.map((item: any) => plainToInstance(GearInfo, item, { excludeExtraneousValues: true }));
    case URLType.GearInfoClothes:
      return response.map((item: any) => plainToInstance(GearInfo, item, { excludeExtraneousValues: true }));
    case URLType.GearInfoShoes:
      return response.map((item: any) => plainToInstance(GearInfo, item, { excludeExtraneousValues: true }));
    case URLType.CoopSkinInfo:
      return response.map((item: any) => plainToInstance(CoopSkinInfo, item, { excludeExtraneousValues: true }));
    case URLType.CoopEnemyInfo:
      return response.map((item: any) => plainToInstance(CoopEnemyInfo, item, { excludeExtraneousValues: true }));
    case URLType.BadgeInfo:
      return response.map((item: any) => plainToInstance(BadgeInfo, item, { excludeExtraneousValues: true }));
    case URLType.NamePlateBgInfo:
      return response.map((item: any) => plainToInstance(NamePlateBgInfo, item, { excludeExtraneousValues: true }));
    default:
      throw new Error("Invalid URLType");
  }
}

export type URLType = (typeof URLType)[keyof typeof URLType];
export type Version = (typeof Version)[keyof typeof Version];
