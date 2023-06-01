import fs from 'fs';

import { plainToInstance } from 'class-transformer';
import fetch, { Response } from 'node-fetch';

import { LocaleType } from '../dto/locale_type';

// import iconv from "iconv-lite";

async function get_game_web_version_hash(): Promise<string> {
  const url = 'https://api.lp1.av5ja.srv.nintendo.net/';
  const re = new RegExp('main.([a-z0-9]{8}).js');

  const response: string = await (await fetch(url)).text();
  return re.test(response) ? re.exec(response)![1] : 'bd36a652';
}

export async function get_web_revision(): Promise<{ revision: string; version: string }> {
  const hash: string = await get_game_web_version_hash();
  const url = `https://api.lp1.av5ja.srv.nintendo.net/static/js/main.${hash}.js`;
  const response = await (await fetch(url)).text();
  const version: string = (() => {
    const re = /`(\d{1}\.\d{1}\.\d{1})-/;
    return re.test(response) ? re.exec(response)![1] : '4.0.0';
  })();
  const revision: string = (() => {
    const re = /REACT_APP_REVISION:"([a-f0-9]{8})/;
    return re.test(response) ? re.exec(response)![1] : 'e2ee936d';
  })();

  return { revision, version };
}

async function get_locales(hash: string): Promise<LocaleType[]> {
  const base_url = `https://api.lp1.av5ja.srv.nintendo.net/static/js/main.${hash}.js`;
  const response: string = await (await fetch(base_url)).text();

  const hashes = /([\d]{2,3}):"([a-f0-9]{8})"/g;
  const results = [...response.matchAll(hashes)]
    .map((result) => {
      return {
        hash: result[2],
        id: result[1],
        hash: result[2],
        revision: hash
      };
    })
    .map((item) => plainToInstance(LocaleType, item, { excludeExtraneousValues: true }))
    .concat([
        plainToInstance(LocaleType, { id: 0, hash: hash, revision: hash }, { excludeExtraneousValues: true }),
    ])
    return results
}

export async function get_locale_bundles(): Promise<void> {
  const hash: string = await get_game_web_version_hash();
  const locales: LocaleType[] = await get_locales(hash);
  locales.forEach(async (locale) => {
    const context: string = await (async (): Promise<string> => {
      const response: Response = await fetch(locale.url);
      return response.text();
    })();
    const re = /JSON.parse\('(.*)'\)\}\}/;
    if (re.test(context)) {
      const match: RegExpMatchArray | null = context.match(re);

      if (match !== null && match.length !== 0) {
        const txt = match[1]
          .replace(/\\x([0-9A-Fa-f]{2})/g, (_, p1) => String.fromCharCode(parseInt('0x00' + p1, 16)))
          .replace(/\\u([0-9A-Fa-f]{4})/g, (_, p1) => String.fromCharCode(parseInt('0x' + p1, 16)))
          .replace(/\\"/g, "'")
          .replace(/\\'/g, "'");
        const context: string = JSON.stringify(JSON.parse(txt), null, 2);
        createFile(context, `src/locales/${hash}/${locale.locale}.json`);
      }
    }
  });
}

export const createFile = (data: string, filePath: string) => {
  fs.writeFile(filePath, data, (err) => {
    // ディレクトリ作成できなかったとき
    if (err && err.code === 'ENOENT') {
      // ディレクトリ部分だけ切り取り
      const dir = filePath.substring(0, filePath.lastIndexOf('/'));

      // 親ディレクトリ作成
      fs.mkdir(dir, { recursive: true }, (err) => {
        if (err) throw err;
        createFile(data, filePath);
      });
      return;
    }
  });
};
