//
//  VsStageKey.swift
//  SplatNet3
//
//  Created by devonly on 2022/11/25.
//  Copyright © 2023 Magi, Corporation. All rights reserved.
//

import Foundation

public enum VsStageKey: String, UnsafeRawRepresentable {
    public static var defaultValue: Self = .Unknown
    public var id: Int { VsStageId.allCases[VsStageKey.allCases.firstIndex(of: self) ?? 0].rawValue }

    /// ユノハナ大渓谷
    case Yunohana = "35f9ca08ccc2bf759774ab2cb886567c117b9287875ca92fb590c1294ddcdc1e"
    /// ゴンズイ地区
    case District = "898e1ae6c737a9d44552c7c81f9b710676492681525c514eadc68a6780aa52af"
    /// ヤガラ市場
    case Yagara = "8dc2f16d39c630bab40cead5b2485ca3559e829d0d3de0c2232c7a62fefb5fa9"
    /// マテガイ放水路
    case Temple = "9b1c17b2075479d0397d2fb96efbc6fa3a28900712920e5fe1e9dfc59c6abc5c"
    /// ナンプラー遺跡
    case Factory = "f14c2a64e49d243679fc0884af91e1a07dc65600f9b90aefe92d7790dcffb191"
    /// ナメロウ金属
    case Scrap = "de1f212e9ff0648f36cd3b8e0917ef36b3bd51445159297dcb948f34a09f2f05"
    /// クサヤ温泉
    case BigSlope = "cd84d711b47a424334569ac20f33f8e0ab6a652dc07854dcd36508a0081e9034"
    /// タラポートショッピングパーク
    case Section = "f70e9f5af477a39ccfab631bfb81c9e2cedb4cd0947fe260847c214a6d23695f"
    /// ヒラメが丘団地
    case Jyoheki = "488017f3ce712fca9fb37d61fe306343054449bb2d2bb1751d95f54a98564cae"
    /// マサバ海峡大橋
    case Kaisou = "1db8ab338b64b464df50e7f9e270e59423ff8caac6f09679a24f1b7acf3a82f3"
    /// キンメダイ美術館
    case Pivot = "b9d8cfa186d197a27e075600a107c99d9e21646d116730f0843e0fff0aaba7dd"
    /// マヒマヒリゾート＆スパ
    case Hiagari = "8273118c1ffe1bf6fe031c7d8c9795dab52632c9b76e8e9f01f644ac5ae0ccc0"
    /// 海女美術大学
    case Upland = "40aba8b36a9439e2d670fde5b3478819ea8a94f9e503b9d783248a5716786f35"
    /// チョウザメ造船
    case Nagasaki = "48684c69d5c5a4ffaf16b712a4895545a8d01196115d514fc878ce99863bb3e9"
    /// ザトウマーケット
    case Line = "a8ba96c3dbd015b7bc6ea4fa067245c4e9aee62b6696cb41e02d35139dd21fe7"
    /// スメーシーワールド
    case Carousel = "61ea801fa4ed32360dcaf83986222ded46a72dbf56194acc6d0cf4659a92ba85"
    /// コンブトラック
    case Wave = "7b3cf118bd9f45d141cd6db0ee75b06e697fa83945c7fe1e6f8483de6a591f5f"
    /// マンタマリア号
    case Pillar = "0b7fd997781e03eb9d5bf1875ed070f698afc654f4fe929452c65aa26c0a35fd"
    /// ？？？
    case Unknown = "59a42245071d692c58b9825886f89f95e092ae0aa83a46617fdb4cbcb2f5f2b8"
//    case Unknown = "e5c5889e3e4278352283021adc2b1a8cf07fed973d216c7739804b38f418ba93"
}
