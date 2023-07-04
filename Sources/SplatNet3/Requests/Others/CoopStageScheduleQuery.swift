//
//  CoopStageScheduleQuery.swift
//  SplatNet3
//
//  Created by devonly on 2022/12/04.
//  Copyright © 2023 Magi, Corporation. All rights reserved.
//

import Alamofire
import Foundation

public class CoopStageScheduleQuery: RequestType {
    public typealias ResponseType = [CoopSchedule]
    #if DEBUG
        public var baseURL = URL(unsafeString: "http://localhost:3000/")
    #else
        public var baseURL = URL(unsafeString: "https://api.splatnet3.com/")
    #endif
    public var path: String = "v1/schedules"
    public var parameters: Parameters?
    public var method: HTTPMethod = .get

    init() {}
}
