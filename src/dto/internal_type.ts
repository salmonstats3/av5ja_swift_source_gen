import { createHash } from 'crypto';

import { Expose, Transform } from 'class-transformer';

export interface InternalType {
  hash: string;
  row_id: string;
}

function calc_hash(key: string): string {
  const hash = createHash('sha256');
  hash.update(key);
  return hash.digest('hex');
}

export class CoopEnemyInfo implements InternalType {
  @Expose({ name: 'Type' })
  @Transform((param) => param.value)
  row_id: string;

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

export class WeaponInfo implements InternalType {
  @Expose({ name: 'Id' })
  id: number;

  @Expose({ name: 'Label' })
  label: string;

  @Expose({ name: '__RowId' })
  row_id: string;

  @Expose()
  @Transform((param) => calc_hash(param.obj.__RowId))
  hash: string;

  get for_coop(): boolean {
    if (!this.row_id.includes('_Coop')) {
      return false;
    }
    const row_id: string = this.row_id.replace('_Coop', '_00');
    this.hash = calc_hash(row_id);
    this.id = this.id - 20000;
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
