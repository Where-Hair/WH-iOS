//
//  MainViewModel.swift
//  WH-iOS
//
//  Created by 문지수 on 2021/04/15.
//

import Foundation

import RxSwift
import RxCocoa

class MainViewModel: ViewModelType {
    
    private let disposeBag = DisposeBag()
    
    struct Input {
        let loadData: Signal<Void>
    }
    struct Output {
        let result: Signal<String>
        let loadData: BehaviorRelay<[MainModel]>
    }
    
    func transform(input: Input) -> Output {
        let api = Service()
        let result = PublishSubject<String>()
        let loadData = BehaviorRelay<[MainModel]>(value: [])
        
        input.loadData.asObservable().subscribe(onNext: { _ in
            api.showMain().asObservable().subscribe(onNext: { _ ,response in
                switch response {
                case .success:
                    result.onCompleted()
                case .forbidden:
                    result.onNext("forbidden")
                default:
                    print("main default")
                }
            }).disposed(by: self.disposeBag)
        }).disposed(by: disposeBag)
        
        return Output(result:result.asSignal(onErrorJustReturn: ""), loadData: loadData)
    }
}
