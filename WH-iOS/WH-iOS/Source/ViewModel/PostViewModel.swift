//
//  PostViewModel.swift
//  WH-iOS
//
//  Created by 문지수 on 2021/05/06.
//

import Foundation
import RxSwift
import RxCocoa

class PostViewModel: ViewModelType {
    
    private let disposeBag = DisposeBag()
    
    struct Input {
        let isName: Driver<String>
        let isLocation: Driver<String>
        let isIntroduce: Driver<String>
        let isInformation: Driver<String>
        let isImg: Driver<Data?>
        let postTap: Driver<Void>
    }
    struct Output {
        let result: Signal<String>
        let isEnable: Driver<Bool>
    }
    
    func transform(input: Input) -> Output {
        let api = Service()
        let result = PublishSubject<String>()
        let info = Driver.combineLatest(input.isName, input.isLocation, input.isIntroduce, input.isInformation, input.isImg)
        let isEnable = info.map{ !$0.0.isEmpty && !$0.1.isEmpty && !$0.2.isEmpty && !$0.3.isEmpty  }
        
        input.postTap.asObservable().withLatestFrom(info).subscribe(onNext: { [weak self] name, location, introduce, information, img in
            guard let self = self else { return }
            api.post(name, location, introduce, information, img ?? nil).subscribe(onNext: { response in
                switch response {
                case .success:
                    result.onCompleted()
                case .notFound:
                    result.onNext("NOT FOUND")
                default:
                    result.onNext("post default")
                }
            }).disposed(by: self.disposeBag)
        }).disposed(by: disposeBag)

        return Output(result: result.asSignal(onErrorJustReturn: ""), isEnable: isEnable.asDriver(onErrorJustReturn: false))
    }
}
