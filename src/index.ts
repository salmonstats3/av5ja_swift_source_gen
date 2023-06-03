import { LocaleType } from "./dto/locale_type";
import { Translation } from "./dto/translation";

const locales: LocaleType[] = await LocaleType.all_cases();

locales.forEach(async (locale: LocaleType) => {
  const translation: Translation = await locale.get_translation()
  translation.write()
})