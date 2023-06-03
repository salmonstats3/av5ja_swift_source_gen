import { LocaleType } from "./dto/locale_type";
// import { get_web_revision, get_locale_bundles } from "./utils/revision";
import { Translation } from "./dto/translation";

const locales: LocaleType[] = await LocaleType.all_cases();
console.log(locales)

locales.forEach(async (locale: LocaleType) => {
  const translation: Translation = await locale.get_translation()
  console.log(translation)
})

// // 内部データからEnumを生成する
// Object.values(URLType).forEach(async (url) => {
//   const data: EnumURLType = await EnumURLType.from(url, Version.V400);
//   const writer = new SwiftEnumWriter(data);
//   Object.values(OutputType).forEach((type) => {
//     writer.write(type);
//   });
// });

// // 内部データの翻訳を取得する
// Object.entries(LocaleId).forEach(async ([key, locale]) => {
//     const url: string = `https://leanny.github.io/splat3/data/language/${key}.json`
//     const translation: Translation = plainToInstance(Translation, await (await fetch(url)).json(), { excludeExtraneousValues: true })
//     translation.write(locale)
// })