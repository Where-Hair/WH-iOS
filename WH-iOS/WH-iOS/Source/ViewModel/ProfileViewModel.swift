//
//  ProfileViewModel.swift
//  WH-iOS
//
//  Created by 문지수 on 2021/04/15.
//

import Foundation

import RxSwift
import RxCocoa

class ProfileViewModel: ViewModelType {
    
    private let disposeBag = DisposeBag()
    
    struct Input {
        let loadData: Signal<Void>
    }
    struct Output {
        let result: Signal<String>
        let loadData: PublishRelay<ProfileModel?>
    }
    
    func transform(input: Input) -> Output {
        let api = Service()
        let result = PublishSubject<String>()
        let loadData = PublishRelay<ProfileModel?>()
        
        input.loadData.asObservable().subscribe(onNext: { [weak self] _ in
            guard let self = self else { return }
            api.showProfile().subscribe(onNext: { data, response in
                switch response {
                case .success:
                    loadData.accept(data!)
                    result.onCompleted()
                case .notFound:
                    result.onNext("notFound")
                default:
                    result.onNext("프로필을 불러 올 수 없음")
                }
            }).disposed(by: self.disposeBag)
        }).disposed(by: disposeBag)
        
        return Output(result: result.asSignal(onErrorJustReturn: "프로필 로드 실패"), loadData: loadData)
    }
}
