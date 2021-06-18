//
//  SignInReactor.swift
//  WH-iOS
//
//  Created by 문지수 on 2021/06/15.
//

import Foundation

import ReactorKit
import RxSwift
import RxFlow
import RxCocoa

final class SignInReactor: Reactor, Stepper {
    enum Action {
        case id(String)
        case password(String)
        case doneTap
    }
    enum Mutation {
        case setId(String)
        case setPassword(String)
        case setSignIn
        case setError
        case notAuth
        case isEmpty
    }
    struct State {
        var id: String
        var password: String
        var result: String?
        var isEnable: Bool
        var complete: Bool
    }
    
    let initialState: State
    private let service: Service
    var steps: PublishRelay<Step> = .init()
    
    init(_ service: Service) {
        self.service = service
        initialState = State(id: "", password: "", result: nil, isEnable: false, complete: false)
    }
    
//    func mutate(action: Action) -> Observable<Mutation> {
//
//    }

}
