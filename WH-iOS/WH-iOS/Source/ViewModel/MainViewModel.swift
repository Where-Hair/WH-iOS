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
        let loadDetail: Signal<Void>
       // let selectIndexPath: Signal<Int>
    }
    struct Output {
        let result: Signal<String>
        let loadData: BehaviorRelay<[MainModel]>
        let loadDetail: BehaviorRelay<[MainModel]>
    }
    
    func transform(input: Input) -> Output {
        let api = Service()
        let result = PublishSubject<String>()
        let loadDetail = BehaviorRelay<[MainModel]>(value: [])
        let loadData = BehaviorRelay<[MainModel]>(value: [])
        
        input.loadData.asObservable()
            .flatMap{_ in api.showMain()}
            .subscribe(onNext:  { _, response in
                switch response {
                case .success:
                    result.onCompleted()
                case .forbidden:
                    result.onNext("forbidden")
                default:
                    print("default")
                }
            }).disposed(by: disposeBag)
        
        input.loadDetail.asObservable()
            .flatMap{ _ in api.detailMain()}
            .subscribe(onNext: { _, response in
                switch response {
                case .success:
                    result.onCompleted()
                case .conflict:
                    result.onNext("conflict")
                default:
                    print("default")
                }
            }).disposed(by: disposeBag)
        
        return Output(result:result.asSignal(onErrorJustReturn: ""), loadData: loadData, loadDetail: loadDetail)
    }
}
