//
//  Network.swift
//  WH-iOS
//
//  Created by 문지수 on 2021/03/30.
//

import Foundation

enum Network: Int, Error {
    case success = 200
    case ok = 201
    case forbidden = 403
    case notFound = 404
    case conflict = 409
    
}
