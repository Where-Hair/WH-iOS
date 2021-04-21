//
//  DetailViewModel.swift
//  WH-iOS
//
//  Created by 문지수 on 2021/04/20.
//

import Foundation

import RxSwift
import RxCocoa

class DetailViewModel: ViewModelType {
    
    private let disposeBag = DisposeBag()
    
    struct Input {
        let loadData: Signal<Void>
    }
    struct Output {
        let result: Signal<String>
        let loadData: BehaviorRelay<[DetailModel]>
    }
    
    func transform(input: Input) -> Output {
        let api = Service()
        let result = PublishSubject<String>()
        let loadData = BehaviorRelay<[DetailModel]>(value: [])
        
        input.loadData.asObservable().subscribe(onNext: { _ in
            api.detailMain().asObservable().subscribe(onNext: { _ ,response in
                switch response {
                case .success:
                    result.onCompleted()
                case .conflict:
                    result.onNext("conflict")
                default:
                    print("detail default")
                }
            }).disposed(by: self.disposeBag)
        }).disposed(by: disposeBag)
        
        return Output(result: result.asSignal(onErrorJustReturn: ""), loadData: loadData)
    }
}
