import { EnumURLType } from './dto/internal_type'
import { LocaleType } from './dto/locale_type'
import { Translation } from './dto/translation'
import { Version, URLType } from './dto/urls'
import { SwiftEnumWriter } from './utils/enum'
import { SHA256Hash } from './utils/hashes'

console.log('Getting translations from SplatNet3')
const locales: LocaleType[] = await LocaleType.all_cases()

// 翻訳の出力
locales.forEach(async (locale: LocaleType) => {
  const translation: Translation = await locale.get_translation()
  translation.write()
})

// Enumの出力
Object.values(URLType).forEach(async (url: URLType) => {
  const data: EnumURLType = await EnumURLType.from(url, Version.V600)
  const writer = new SwiftEnumWriter(data)

  writer.write()
})

// SHA256Hashの出力
await SHA256Hash.write()
