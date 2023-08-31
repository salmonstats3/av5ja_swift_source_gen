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

  private body(output: OutputType): string[] {
    const class_name: string = this.type.split('.')[0];

    const bodies: string[] = (() => {
      if (output === OutputType.Key) {
        return [
          `public enum ${class_name}Key: String, UnsafeRawRepresentable {`,
          `    public static var defaultValue: Self = .${this.values[0].row_id.replace(/_/g, '')}`,
          `    public var id: Int { ${class_name}Id.allCases[${class_name}Key.allCases.firstIndex(of: self) ?? 0].rawValue }`,
          '',
        ];
      } else {
        return [
          `public enum ${class_name}Id: Int, UnsafeRawRepresentable {`,
          `    public static var defaultValue: Self = .${this.values[0].row_id.replace(/_/g, '')}`,
          `    public var id: Int { rawValue }`,
          '',
        ];
      }
    })();

    this.values.forEach((value) => {
      if (value.label !== undefined) {
        bodies.push(`    ///  ${value.label}`);
      }
      if (output === OutputType.Key) {
        bodies.push(`    case ${value.row_id.replace(/_/g, '')} = "${value.hash}"`);
      } else {
        bodies.push(`    case ${value.row_id.replace(/_/g, '')} = ${value.id}`);
      }
    });
    bodies.push('}');
    return bodies;
  }

  private source(output: OutputType): string {
    return this.header.concat(this.body(output)).join('\n');
  }

  write(output: OutputType): void {
    const context: string = this.source(output);
    const file_name = `sources/${output}s/${this.type.split('.')[0]}${output}.swift`;
    createFile(context, file_name);
  }

  constructor(type: EnumURLType) {
    this.type = type.key;
    this.values = type.values;
  }
}
