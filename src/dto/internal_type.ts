import { createHash } from 'crypto';

import { Expose, Transform } from 'class-transformer';

import { URLType, Version, request } from './urls';

export class EnumURLType {
  key: URLType;
  values: InternalType[];

  constructor(key: URLType, values: InternalType[]) {
    this.key = key;
    this.values = values;
  }

  static async from(key: URLType, version: Version): Promise<EnumURLType> {
    return new EnumURLType(key, await request(key, version));
  }
}

export interface InternalType {
  hash: string;
  id: number;
  label?: string;
  row_id: string;
}

export function calc_hash(key: string): string {
  const hash = createHash('sha256');
  hash.update(key);
  return hash.digest('hex');
}

export class CoopEnemyInfo implements InternalType {
  @Expose()
  @Transform((param) => {
    switch (param.obj.Type) {
      case 'SakelienBomber':
        return 4;
      case 'SakelienCupTwins':
        return 5;
      case 'SakelienShield':
        return 6;
      case 'SakelienSnake':
        return 7;
      case 'SakelienTower':
        return 8;
      case 'Sakediver':
        return 9;
      case 'Sakerocket':
        return 10;
      case 'SakePillar':
        return 11;
      case 'SakeDolphin':
        return 12;
      case 'SakeArtillery':
        return 13;
      case 'SakeSaucer':
        return 14;
      case 'SakelienGolden':
        return 15;
      case 'Sakedozer':
        return 17;
      case 'SakeBigMouth':
        return 20;
      case 'SakelienGiant':
        return 23;
      case 'SakeRope':
        return 24;
      default:
        return -1;
    }
  })
  id: number;

  @Expose({ name: 'Type' })
  @Transform((param) => param.value)
  row_id: string;

  @Expose()
  @Transform((param) => calc_hash(param.obj.Type))
  hash: string;
}

export class CoopSkinInfo implements InternalType {
  @Expose({ name: 'Id' })
  id: number;

  @Expose({ name: '__RowId' })
  row_id: string;

  @Expose()
  @Transform((param) => calc_hash(param.obj.__RowId))
  hash: string;
}

export class WeaponInfoMain implements InternalType {
  @Expose({ name: 'Id' })
  id: number;

  @Expose({ name: 'Label' })
  label: string;

  @Expose({ name: '__RowId' })
  row_id: string;

  @Expose()
  @Transform((param) => calc_hash(param.obj.__RowId))
  hash: string;

  static get Random_Green(): InternalType {
    return {
      hash: '473fffb2442075078d8bb7125744905abdeae651b6a5b7453ae295582e45f7d1',
      id: -1,
      label: '緑ランダム',
      row_id: 'Random_Green',
    } as InternalType;
  }

  static get Random_Gold(): InternalType {
    return {
      hash: '9d7272733ae2f2282938da17d69f13419a935eef42239132a02fcf37d8678f10',
      id: -2,
      label: '金ランダム',
      row_id: 'Random_Gold',
    } as InternalType;
  }

  static get Dummy(): InternalType {
    return {
      hash: 'a23d035e2f37c502e85b6065ba777d93f42d6ca7017ed029baac6db512e3e17f',
      id: -999,
      label: 'はてな',
      row_id: 'Dummy',
    } as InternalType;
  }

  get for_coop(): boolean {
    if (!this.row_id.includes('_Coop')) {
      return false;
    }
    if (!this.row_id.includes('Bear')) {
      this.id = this.id - 20000;
      const row_id: string = this.row_id.replace('_Coop', '_00');
      this.row_id = this.row_id.replace('_Coop', '');
      this.label = this.label.replace('Coop', '');
      this.hash = calc_hash(row_id);
    } else {
      this.hash = calc_hash(this.row_id);
      this.row_id = this.row_id.replace('_Coop', '');
    }
    return true;
  }
}

export class WeaponInfoSpecial implements InternalType {
  @Expose({ name: 'Id' })
  id: number;

  @Expose({ name: 'Label' })
  label: string;

  @Expose({ name: '__RowId' })
  row_id: string;

  @Expose()
  @Transform((param) => calc_hash(param.obj.__RowId))
  hash: string;

  static get Random_Green(): InternalType {
    return {
      hash: '473fffb2442075078d8bb7125744905abdeae651b6a5b7453ae295582e45f7d1',
      id: -1,
      label: '緑ランダム',
      row_id: 'Random_Green',
    } as InternalType;
  }

  get for_coop(): boolean {
    if (!this.row_id.includes('_Coop')) {
      return false;
    }
    const row_id: string = this.row_id.replace('_Coop', '');
    this.row_id = row_id;
    this.label = this.label.replace('Coop', '');
    this.hash = calc_hash(row_id);
    if (this.id === 20001) {
      this.id = 1;
    }
    return true;
  }
}

export class GearInfo implements InternalType {
  @Expose({ name: 'Id' })
  id: number;

  @Expose({ name: 'Label' })
  label: string;

  @Expose({ name: '__RowId' })
  row_id: string;

  @Expose()
  @Transform((param) => calc_hash(param.obj.__RowId))
  hash: string;
}

export class NamePlateBgInfo implements InternalType {
  @Expose({ name: 'Id' })
  id: number;

  @Expose({ name: '__RowId' })
  row_id: string;

  @Expose()
  @Transform((param) => calc_hash(param.obj.__RowId))
  hash: string;
}

export class BadgeInfo implements InternalType {
  @Expose({ name: 'Id' })
  id: number;

  @Expose({ name: 'Name' })
  row_id: string;

  @Expose()
  @Transform((param) => calc_hash(param.obj.Name))
  hash: string;
}
