//
//  MainViewController.swift
//  WH-iOS
//
//  Created by 문지수 on 2021/04/01.
//

import UIKit

import RxSwift
import RxCocoa
import SnapKit
import Then

class MainViewController: UIViewController {
    
    private let disposeBag = DisposeBag()
    private let viewModel = MainViewModel()
    
    private let loadData = BehaviorRelay<Void>(value: ())
    private let loadDetail = BehaviorRelay<Void>(value: ())
    var selectIndexPath = PublishRelay<Int>()
    
    private let mainCell = MainCell()
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.addSubview(tableView)
        view.addSubview(mainCell)
        
        constantraint()
        configureTableView()
    }
    
    func bindViewModel() {
        let input = MainViewModel.Input(loadData: loadData.asSignal(onErrorJustReturn: ()))
        let output = viewModel.transform(input: input)
        
        output.loadData.bind(to: tableView.rx.items(cellIdentifier: "mainCell", cellType: MainCell.self)) { (row, element, cell) in
            cell.profileImage.image = UIImage(named: element.profileImage)
            cell.shopNameLbl.text = element.name
            cell.textLbl.text = element.introduce
            
            cell.heartBtn.rx.tap.subscribe(onNext: { _ in
                self.selectIndexPath.accept(row)
            }).disposed(by: self.disposeBag)
        }.disposed(by: disposeBag)
    
    }
    
    
    func constantraint() {
        tableView.snp.makeConstraints { (make) in
            make.center.equalTo(view)
            make.top.equalTo(view.frame.height)
            make.bottom.equalTo(view.frame.height)
        }
    }

    func configureTableView() {
        let nib = UINib(nibName: "MainCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "mainCell")
        tableView.rowHeight = 300
    }
}
