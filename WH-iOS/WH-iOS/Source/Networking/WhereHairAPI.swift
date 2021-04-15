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
    case signUp(_ nickname: String, _ id: String, _ password: String)
    case showProfile(_ id: String)
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
        case .showProfile:
            return "/showProfile"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .signIn, .signUp:
            return .post
        case .showProfile:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .signIn(let id, let password):
            return .requestParameters(parameters: ["id": id, "password": password], encoding: JSONEncoding.prettyPrinted)
        case .signUp(let nickname, let id, let password):
            return .requestParameters(parameters: ["nickname": nickname,"id": id, "password": password], encoding: JSONEncoding.prettyPrinted)
        default:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .signIn, .signUp:
            return nil
        case .showProfile:
            guard let token = TokenManager.currentToken?.accessToken else { return nil }
            return ["Authorization" : "Bearer " + token]
        }
    }
}
