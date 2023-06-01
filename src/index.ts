// import { URLType, Version, request } from "./dto/urls"
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