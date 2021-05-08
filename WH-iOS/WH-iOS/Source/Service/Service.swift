//
//  Service.swift
//  WH-iOS
//
//  Created by 문지수 on 2021/03/30.
//

import Foundation

import RxSwift
import Moya

class Service {
    let provider = MoyaProvider<WhereHairAPI>()
    
    func signIn(_ id: String, _ password: String) -> Observable<Network> {
        return provider.rx.request(.signIn(id, password))
            .filterSuccessfulStatusCodes()
            .asObservable()
            .map { _ -> Network in
                return (.success)
            }.catchError { [unowned self] in return .just(self.setNetworkError($0)) }
    }
    
    func signUp(_ nickname: String, _ id: String, _ password: String) -> Observable<Network> {
        return provider.rx.request(.signUp(nickname, id, password))
            .filterSuccessfulStatusCodes()
            .asObservable()
            .map { _ -> Network in
                return (.success)
            }.catchError { [unowned self] in return .just(self.setNetworkError($0))}
    }
    
    func showProfile() -> Observable<(ProfileModel?, Network)> {
        return provider.rx.request(.showProfile)
            .filterSuccessfulStatusCodes()
            .asObservable()
            .map(ProfileModel.self)
            .map { return ($0, .success) }
            .catchError { _ in return .just((nil, .fail))}
    }
    
    func showMain() -> Observable<(MainModel?, Network)> {
        return provider.rx.request(.showMain)
            .filterSuccessfulStatusCodes()
            .asObservable()
            .map(MainModel.self)
            .map{ return ($0, .success) }
            .catchError{ _ in return .just((nil, .fail))}
    }
    
    func detailMain() -> Observable<(DetailModel?, Network)> {
        return provider.rx.request(.detailMain)
            .filterSuccessfulStatusCodes()
            .asObservable()
            .map(DetailModel.self)
            .map{ return ($0, .success) }
            .catchError{ _ in return .just((nil, .fail))}
    }
    
    func post(_ name: String, _ location: String, _ introduce: String, _ informaion: String, _ img: Data?) -> Observable<Network> {
        return provider.rx.request(.post(name, location, introduce, informaion, img))
            .filterSuccessfulStatusCodes()
            .asObservable()
            .map { _ -> Network in
                return (.success)
            }.catchError{ [unowned self] in return .just(self.setNetworkError($0))}
    }
    
    func setNetworkError(_ error: Error) -> Network {
        guard let status = (error as? MoyaError)?.response?.statusCode else { return (.fail) }
         print(error)
        return (Network(rawValue: status) ?? .fail)
     }
}
