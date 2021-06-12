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
    case showProfile
    case showMain
    case detailMain
    case post(_ name: String, _ location: String, _ introduce: String, _ informaion: String, _ img: Data?)
}

extension WhereHairAPI: TargetType {
    var baseURL: URL {
        return URL(string: "http://localhost:3000")!
    }
    
    var path: String {
        switch self {
        case .signIn:
            return "/signIn"
        case .signUp:
            return "/signUp"
        case .showProfile:
            return "/showProfile"
        case .showMain:
            return "/showMain"
        case .detailMain:
            return "/detailMain"
        case .post:
            return "/write"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .signIn, .signUp, .post:
            return .post
        case .showProfile, .showMain, .detailMain:
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
        case .post(let name, let location, let introduce, let information, let img):
            return .uploadMultipart([Moya.MultipartFormData(provider: .data(img ?? Data()), name: "image", fileName: "image.jpg", mimeType: "image/jpg")])
        default:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .signIn, .signUp:
            return nil
        case .showProfile,.showMain, .detailMain, .post:
            guard let token = TokenManager.currentToken?.accessToken else { return nil }
            return ["Authorization" : "Bearer " + token]
        }
    }
}

enum Network: Int, Error {
    case success = 200
    case ok = 201
    case forbidden = 403
    case notFound = 404
    case conflict = 409
    case fail
}
