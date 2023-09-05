import camelCase from 'camelcase';
import dayjs from 'dayjs';
import fetch from 'node-fetch';

import { createFile } from './revision';

class Hash {
  id: string;
  key: string;

  constructor(id: string, key: string) {
    this.id = id;
    this.key = key;
  }
}

export class SHA256Hash {
  static async write(): Promise<void> {
    const hashes: Hash[] = await this.get_hash();
    const created_at: string = dayjs().format('YYYY/MM/DD');
    const created_year: string = dayjs().format('YYYY');
    const source: string[] = [
      '//',
      `//  LocalizedType.swift`,
      '//  SplatNet3',
      '//',
      `//  Created by devonly on ${created_at}.`,
      `//  Copyright © ${created_year} Magi, Corporation. All rights reserved.`,
      '//',
      '//  Generated automatically by SplatNet3Gen, do not edit.',
      '//',
      '',
      'import Foundation',
      '',
      `public enum SHA256Hash: String, CaseIterable, Identifiable {`,
      `    public var id: String { rawValue }`,
      '',
    ].concat(
      hashes
        .sort((a, b) => (a.id > b.id ? 1 : -1))
        .map((hash) => `\t case ${camelCase(hash.id, { pascalCase: true })} = "${hash.key}"`),
    );
    source.push('}');
    createFile(source.join('\n'), `sources/SHA256Hash.swift`);
  }

  private static async get_hash(): Promise<Hash[]> {
    const hash: string = await this.get_revision();
    const url = `https://api.lp1.av5ja.srv.nintendo.net/static/js/main.${hash}.js`;
    const response: string = await (await fetch(url)).text();
    const regexp = /id:"([a-f0-9]{64})",metadata:{},name:"([\w]*)"/g;
    const matches: IterableIterator<RegExpMatchArray> = response.matchAll(regexp);
    const hashes = [...matches].map((match) => new Hash(camelCase(match[2], { pascalCase: true }), match[1]));
    return hashes;
  }

  private static async get_revision(): Promise<string> {
    const url = 'https://api.lp1.av5ja.srv.nintendo.net/';
    const response: string = await (await fetch(url)).text();
    const regexp = /static\/js\/main.([a-f0-9]{8}).js/;
    const match = regexp.exec(response);
    if (match == null) throw new Error('Invalid response');
    return match[1];
  }
}
