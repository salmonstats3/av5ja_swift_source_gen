// import { URLType, Version, request } from "./dto/urls"
import { EnumURLType } from "./dto/internal_type"
import { URLType, Version } from "./dto/urls"
import { OutputType, SwiftEnumWriter } from "./utils/enum"
import { get_web_revision, get_locale_bundles } from "./utils/revision"

// 内部データを取得する
// Object.values(URLType).forEach(async (url) => {
//     const response = await request(url, Version.V400)
//     console.log(response)
// })

// イカリング3からデータを取得する
const response = await get_web_revision()
console.log(response)
await get_locale_bundles()

Object.values(URLType).forEach(async (url) => {
    const data: EnumURLType = await EnumURLType.from(url, Version.V400)
    const writer = new SwiftEnumWriter(data)
    Object.values(OutputType).forEach((type) => {
        writer.write(type)
    })
})
