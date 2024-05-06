import dayjs from "dayjs";

import { createFile } from "./revision";

import type { EnumURLType, InternalType } from "@/dto/internal_type";
import type { URLType } from "@/dto/urls";

export const OutputType = {
  Id: "Id",
  Key: "Key",
} as const;

type OutputType = (typeof OutputType)[keyof typeof OutputType];

export class SwiftEnumWriter {
  readonly type: URLType;
  readonly values: InternalType[];

  private get header(): string[] {
    const created_at: string = dayjs().format("YYYY/MM/DD");
    const created_year: string = dayjs().format("YYYY");
    const headers: string[] = [
      "//",
      `//  ${this.type.split(".")[0]}.swift`,
      "//  SP3KeyHash",
      "//",
      `//  Created by tkgstrator on ${created_at}.`,
      `//  Copyright @ ${created_year} Magi, Corporation. All rights reserved.`,
      "//",
      "//  Generated automatically by SplatNet3Gen, do not edit.",
      "//",
      "",
      "import Foundation",
      "",
    ];
    return headers;
  }

  private build_all_cases(): string[] {
    return [
      "\t\tpublic static let allCases: AllCases = [",
      this.values.map((value) => `\t\t\t.${value.row_id.replace(/_/g, "")},`),
      "\t\t]",
      "",
    ].flat();
  }

  private bulid_body_id(): string[] {
    const bodies: string[] = [
      `\t// swiftlint:disable:next type_name type_body_length`,
      `\tpublic enum Id: UndefinedRawRepresentable, InternalCode {`,
      `\t\tpublic typealias RawValue = Int`,
      "",
    ].concat(this.build_all_cases());
    bodies.push("\t\tpublic var rawValue: RawValue {");
    bodies.push("\t\t\tswitch self {");
    this.values.forEach((value) => {
      bodies.push(`\t\t\tcase .${value.row_id.replace(/_/g, "")}:`);
      bodies.push(`\t\t\t\treturn ${value.id}`);
    });
    bodies.push("\t\t\tcase .Undefined(let rawValue):");
    bodies.push("\t\t\t\treturn rawValue");
    bodies.push("\t\t\t}");
    bodies.push("\t\t}");
    bodies.push("");
    this.values.forEach((value) => {
      bodies.push(`\t\tcase ${value.row_id.replace(/_/g, "")}`);
    });
    bodies.push("\t\tcase Undefined(RawValue)");
    bodies.push("\t}");
    return bodies;
  }

  private bulid_body_hash(): string[] {
    const bodies: string[] = [
      `\t// swiftlint:disable:next type_body_length`,
      `\tpublic enum Key: UndefinedRawRepresentable, HashKey {`,
      `\t\tpublic typealias RawValue = String`,
      "",
    ].concat(this.build_all_cases());
    bodies.push("\t\tpublic var rawValue: RawValue {");
    bodies.push("\t\t\tswitch self {");
    this.values.forEach((value) => {
      bodies.push(`\t\t\tcase .${value.row_id.replace(/_/g, "")}:`);
      bodies.push(`\t\t\t\treturn "${value.hash}"`);
    });
    bodies.push("\t\t\tcase .Undefined(let rawValue):");
    bodies.push("\t\t\t\treturn rawValue");
    bodies.push("\t\t\t}");
    bodies.push("\t\t}");
    bodies.push("");
    this.values.forEach((value) => {
      bodies.push(`\t\tcase ${value.row_id.replace(/_/g, "")}`);
    });
    bodies.push("\t\tcase Undefined(RawValue)");
    bodies.push("\t}");
    return bodies;
  }

  private build_body(): string[] {
    const class_name: string = this.type.split(".")[0];

    let bodies: string[] = [
      "// swiftlint:disable:next type_body_length",
      `public enum ${class_name}: Compositable {`,
    ];
    bodies = bodies.concat(this.bulid_body_hash());
    bodies.push("");
    bodies = bodies.concat(this.bulid_body_id());
    bodies.push("}");
    return bodies;
  }

  private build_source(): string {
    return this.header.concat(this.build_body()).join("\n");
  }

  write(): void {
    const context: string = this.build_source();
    const file_name = `Sources/SplatNet3/Enum/${this.type.split(".")[0]}.swift`;
    createFile(context, file_name);
  }

  constructor(type: EnumURLType) {
    this.type = type.key;
    this.values = type.values.sort((a: any, b: any) => a.id - b.id);
  }
}
