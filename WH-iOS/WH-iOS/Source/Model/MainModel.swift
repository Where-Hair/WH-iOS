//
//  MainModel.swift
//  WH-iOS
//
//  Created by 문지수 on 2021/04/15.
//

import Foundation

struct MainModel: Codable {
    let profileImage: String
    let name: String
    let content: String
    let shopImage: String
    let review: String
    let isHeart: Bool
}

struct DetailModel: Codable {
    let profileImage: String
    let name: String
    let content: String
    let shopImage: String
    let review: String
    let isHeart: Bool
}
