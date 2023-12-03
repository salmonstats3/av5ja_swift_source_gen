import dayjs from 'dayjs';

import { createFile } from './revision';

import { EnumURLType, InternalType } from '@/dto/internal_type';
import { URLType } from '@/dto/urls';

export const OutputType = {
  Id: 'Id',
  Key: 'Key',
} as const;

type OutputType = (typeof OutputType)[keyof typeof OutputType];

export class SwiftEnumWriter {
  readonly type: URLType;
  readonly values: InternalType[];

  private get header(): string[] {
    const created_at: string = dayjs().format('YYYY/MM/DD');
    const created_year: string = dayjs().format('YYYY');
    const headers: string[] = [
      '//',
      `//  ${this.type.split('.')[0]}.swift`,
      '//',
      `//  Created by tkgstrator on ${created_at}.`,
      `//  Copyright @ ${created_year} Magi, Corporation. All rights reserved.`,
      '//',
      '//  Generated automatically by SplatNet3Gen, do not edit.',
      '//',
      '',
      'import Foundation',
      '',
    ];
    return headers;
  }

  private bulid_body_id(): string[] {
    const bodies: string[] = [
      `\tenum Id: Int, CaseIterable, Identifiable, Codable {`,
      `\t\tpublic var id: Int { rawValue }`,
      '',
    ];
    this.values.forEach((value) => {
      bodies.push(`\t\tcase ${value.row_id.replace(/_/g, '')} = ${value.id}`);
    });
    bodies.push('\t}');
    return bodies;
  }

  private bulid_body_hash(): string[] {
    const bodies: string[] = [
      `\tenum Hash: String, CaseIterable, Identifiable, Codable {`,
      `\t\tpublic var id: String { rawValue }`,
      '',
    ];
    this.values.forEach((value) => {
      bodies.push(`\t\tcase ${value.row_id.replace(/_/g, '')} = "${value.hash}"`);
    });
    bodies.push('\t}');
    return bodies;
  }

  private build_body(): string[] {
    const class_name: string = this.type.split('.')[0];

    let bodies: string[] = [
      `public enum ${class_name}: IdHash {`,
      `\tpublic var id: Int { Self.Id.allCases[index].rawValue }`,
      `\tpublic var hash: String { Self.Hash.allCases[index].rawValue }`,
      '',
      '\tpublic init?(id rawValue: Int) {',
      '\t\tguard let index: Int = Self.Id.allCases.firstIndex(where: { $0.rawValue == rawValue }) else {',
      '\t\t\treturn nil',
      '\t\t}',
      '\t\tself = Self.allCases[index]',
      '\t}',
      '',
      '\tpublic init?(hash rawValue: String) {',
      '\t\tguard let index: Int = Self.Hash.allCases.firstIndex(where: { $0.rawValue == rawValue }) else {',
      '\t\t\treturn nil',
      '\t\t}',
      '\t\tself = Self.allCases[index]',
      '\t}',
      '',
    ];
    // Enum Value
    this.values.forEach((value) => {
      if (value.label !== undefined) {
        bodies.push(`\t///  ${value.label}`);
      }
      bodies.push(`\tcase ${value.row_id.replace(/_/g, '')}`);
    });
    bodies.push('');
    bodies = bodies.concat(this.bulid_body_id());
    bodies.push('');
    bodies = bodies.concat(this.bulid_body_hash());
    bodies.push('}');
    return bodies;
  }

  private build_source(): string {
    return this.header.concat(this.build_body()).join('\n');
  }

  write(): void {
    const context: string = this.build_source();
    const file_name = `../Sources/SplatNet3/Enums/IdHash/${this.type.split('.')[0]}.swift`;
    createFile(context, file_name);
  }

  constructor(type: EnumURLType) {
    this.type = type.key;
    this.values = type.values;
  }
}
