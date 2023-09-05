import { EnumURLType } from './dto/internal_type';
import { LocaleType } from './dto/locale_type';
import { Translation } from './dto/translation';
import { Version, URLType } from './dto/urls';
import { OutputType, SwiftEnumWriter } from './utils/enum';

const locales: LocaleType[] = await LocaleType.all_cases();

locales.forEach(async (locale: LocaleType) => {
  const translation: Translation = await locale.get_translation();
  translation.write();
});

Object.values(URLType).forEach(async (url: URLType) => {
  const data: EnumURLType = await EnumURLType.from(url, Version.V400);
  const writer = new SwiftEnumWriter(data);

  Object.values(OutputType).forEach((type) => {
    writer.write(type);
  });
});
