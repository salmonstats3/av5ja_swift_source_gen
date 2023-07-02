//
//  CoopStageScheduleQuery.swift
//
//
//  Created by devonly on 2022/12/04.
//

import Alamofire
import Foundation

public class CoopStageScheduleQuery: RequestType {
    public typealias ResponseType = [CoopSchedule]
    #if DEBUG
        public var baseURL = URL(unsafeString: "https://api.splatnet3.com/")
//    public var baseURL: URL = URL(unsafeString: "http://localhost:3000/")
    #else
        public var baseURL = URL(unsafeString: "https://api.splatnet3.com/")
    #endif
    public var path: String = "v1/schedules"
    public var parameters: Parameters?
    public var headers: [String: String]?
    public var method: HTTPMethod = .get

    init() {}
}
