//
//  DetailViewController.swift
//  WH-iOS
//
//  Created by 문지수 on 2021/04/21.
//

import UIKit

import RxSwift
import RxCocoa

class DetailViewController: UIViewController {
    
    private let disposeBag = DisposeBag()
    private let viewModel = DetailViewModel()
    
    private let loadData = BehaviorRelay<Void>(value: ())
    
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        configureTableView()
    }
    
    func bindViewModel() {
        let input = DetailViewModel.Input(loadData: loadData.asSignal(onErrorJustReturn: ()))
        let output = viewModel.transform(input: input)
        
        output.loadData.bind(to: tableView.rx.items(cellIdentifier: "detailCell", cellType: DetailCell.self)) { (row, element, cell) in
            cell.profileImage.image = UIImage(named: element.profileImage)
            cell.shopNameLbl.text = element.name
            cell.introduceLbl.text = element.introduce
            cell.descriptionLbl.text = element.information
            cell.shopImage.image = UIImage(named: element.shopImage)
        }.disposed(by: disposeBag)
    }
    
    func setUI() {
        backBtn.rx.tap.subscribe(onNext: { _ in
            self.pushVC("mainVC")
        }).disposed(by: disposeBag)
    }
    
    func configureTableView() {
        let nib = UINib(nibName: "DetailCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "detailCell")
        tableView.rowHeight = 600
    }
    

    
    
}


