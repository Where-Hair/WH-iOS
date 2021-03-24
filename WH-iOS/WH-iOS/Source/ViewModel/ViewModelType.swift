//
//  ViewModelType.swift
//  WH-iOS
//
//  Created by 문지수 on 2021/03/24.
//

import Foundation

protocol ViewModelType {
    associatedtype Input
    associatedtype Output

    func transform(input: Input) -> Output
}
