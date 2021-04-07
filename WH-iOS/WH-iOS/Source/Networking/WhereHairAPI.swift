//
//  TestNetworking.swift
//  WH-iOS
//
//  Created by 문지수 on 2021/03/24.
//

import Foundation
import Moya

enum WhereHairAPI {
    case signIn(_ id: String, _ password: String)
    case signUp(_ name: String, _ id: String, _ password: String)
}

extension WhereHairAPI: TargetType {
    var baseURL: URL {
        return URL(string: "/api")!
    }
    
    var path: String {
        switch self {
        case .signIn:
            return "/signIn"
        case .signUp:
            return "/signUp"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .signIn, .signUp:
            return .post
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .signIn(let email, let password):
            return .requestParameters(parameters: ["email": email, "password": password], encoding: JSONEncoding.prettyPrinted)
        case .signUp(let nickname, let email, let password):
            return .requestParameters(parameters: ["nickname": nickname,"email": email, "password": password], encoding: JSONEncoding.prettyPrinted)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .signIn, .signUp:
            return nil
        }
    }
}
