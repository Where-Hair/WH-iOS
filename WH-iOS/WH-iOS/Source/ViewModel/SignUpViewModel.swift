//
//  SignUpViewModel.swift
//  WH-iOS
//
//  Created by 문지수 on 2021/04/08.
//

import Foundation

import RxSwift
import RxCocoa

class SignUpViewModel: ViewModelType {
    
    private let disposeBag = DisposeBag()
    
    struct Input {
        let nickname: Driver<String>
        let id: Driver<String>
        let password: Driver<String>
        let doneTap: Driver<Void>
    }
    struct Output {
        let result: Signal<String>
        let isEnable: Driver<Bool>
    }
    
    func transform(input: Input) -> Output {
        let api = Service()
        let result = PublishSubject<String>()
        let info = Driver.combineLatest(input.nickname, input.id, input.password)
        let isEnable = info.map { !$0.0.isEmpty && !$0.1.isEmpty && !$0.2.isEmpty }
        
        input.doneTap.asObservable().withLatestFrom(info).subscribe(onNext: { [weak self] nickname, id, password in
            guard let self = self else { return }
            api.signUp(nickname, id, password).subscribe(onNext: { response in
                switch response {
                case .success:
                    result.onCompleted()
                case .conflict:
                    result.onNext("이미 존재함")
                default:
                    result.onNext("default")
                }
            }).disposed(by: self.disposeBag)
        }).disposed(by: disposeBag)
        return Output(result: result.asSignal(onErrorJustReturn: "회원가입 실패"), isEnable: isEnable.asDriver())
    }
}
