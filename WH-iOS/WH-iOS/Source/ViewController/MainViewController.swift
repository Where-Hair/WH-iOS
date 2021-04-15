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
