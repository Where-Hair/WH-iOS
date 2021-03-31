//
//  MainViewController.swift
//  WH-iOS
//
//  Created by 문지수 on 2021/03/30.
//

import UIKit

import RxSwift
import RxCocoa
import SnapKit
import Then

class MainViewController: UIViewController {
    
    private let mainCell = MainCell()
    private let tableView = UITableView()
    
    func constantraint() {
        tableView.snp.makeConstraints { (make) in
            make.center.equalTo(view)
            make.top.equalTo(view.frame.height)
            make.bottom.equalTo(view.frame.height)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.addSubview(tableView)
        view.addSubview(mainCell)
        
        constantraint()
    }
}
