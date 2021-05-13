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
    
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        configureTableView()
        bindViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)

        loadData.accept(())
        tableView.reloadData()
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
    
    func setUI() {
        let cell = MainCell()
        
        cell.detailBtn.rx.tap.subscribe(onNext: { _ in
            self.pushVC("detailVC")
        }).disposed(by: disposeBag)
    }

    func configureTableView() {
        let nib = UINib(nibName: "MainCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "mainCell")
        tableView.rowHeight = 220
    }
}
