//
//  TokenManager.swift
//  WH-iOS
//
//  Created by 문지수 on 2021/04/08.
//

import Foundation

struct TokenManager {
    enum token {
        case accessToken
        case refreshToken
    }
    static var currentToken: TokenModel? {
        return StoregaeManager.shared.read()
     }
}
