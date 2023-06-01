import { Expose, Transform } from "class-transformer";
import { createHash } from "crypto";
import { URLType, Version, request } from "./urls";

export class EnumURLType {
    key: URLType
    values: InternalType[]

    constructor(key: URLType, values: InternalType[]) {
        this.key = key
        this.values = values
    }

    static async from(key: URLType, version: Version): Promise<EnumURLType> {
        return new EnumURLType(key, await request(key, version))
    }
}

export interface InternalType {
    id: number
    row_id: string
    hash: string
}

function calc_hash(key: string): string {
  const hash = createHash('sha256');
  hash.update(key);
  return hash.digest('hex');
}

export class CoopEnemyInfo implements InternalType {
    @Expose()
    @Transform((param) => {
        switch (param.obj.Type) {
          case "SakelienBomber":
            return 4;
          case "SakelienCupTwins":
            return 5;
          case "SakelienShield":
            return 6;
          case "SakelienSnake":
            return 7;
          case "SakelienTower":
            return 8;
          case "Sakediver":
            return 9;
          case "Sakerocket":
            return 10;
          case "SakePillar":
            return 11;
          case "SakeDolphin":
            return 12;
          case "SakeArtillery":
            return 13;
          case "SakeSaucer":
            return 14;
          case "SakelienGolden":
            return 15;
          case "Sakedozer":
            return 17;
          case "SakeBigMouth":
            return 20;
          case "SakelienGiant":
            return 23;
          case "SakeRope":
            return 24;
          default:
            return -1;
        }
    })
    id: number

    @Expose({ name: "Type" })
    @Transform((param) => param.value)
    row_id: string

    @Expose()
    @Transform((param) => calc_hash(param.obj.Type))
    hash: string
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

    static get Random_Green(): InternalType {
        return {
            id: -1,
            label: "緑ランダム",
            row_id: "Random_Green",
            hash: "473fffb2442075078d8bb7125744905abdeae651b6a5b7453ae295582e45f7d1"
        } as InternalType
    }
    
    static get Random_Gold(): InternalType {
        return {
            id: -2,
            label: "金ランダム",
            row_id: "Random_Gold",
            hash: "9d7272733ae2f2282938da17d69f13419a935eef42239132a02fcf37d8678f10"
        } as InternalType
    }
    
    static get Dummy(): InternalType {
        return {
            id: -999,
            label: "はてな",
            row_id: "Dummy",
            hash: "a23d035e2f37c502e85b6065ba777d93f42d6ca7017ed029baac6db512e3e17f"
        } as InternalType
    }

    get for_coop(): boolean {
        if (!this.row_id.includes("_Coop")) {
            return false
        }
        const row_id: string = this.row_id.replace("_Coop", "_00")
        this.hash = calc_hash(row_id)
        if (!this.row_id.includes("Bear")) {
          this.id = this.id - 20000;
        }
        return true
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
