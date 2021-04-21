//
//  DetailViewController.swift
//  WH-iOS
//
//  Created by 문지수 on 2021/04/21.
//

import UIKit

import RxSwift
import RxCocoa
import SnapKit
import Then

class DetailViewController: UIViewController {
    
    private let profileImage = UIImageView().then {
        $0.clipsToBounds = true
        $0.layer.borderColor = UIColor.black.cgColor
        $0.image = UIImage(named: "WH_Logo")
    }
    private let shopName = UILabel().then {
        $0.textColor = .black
        $0.font = UIFont(name: "NanumSquareRoundR", size: 23)
    }
    private let heartLbl = UILabel().then {
        $0.text = "추천"
        $0.textColor = .mainColor
        $0.font = UIFont(name: "NanumSquareRoundR", size: 12)
    }
    private let heartNumLbl = UILabel().then {
        $0.textColor = .black
        $0.font = UIFont(name: "NanumSquareRoundR", size: 12)
    }
    private let introduceLbl = UILabel().then {
        $0.textColor = .black
        $0.font = UIFont(name: "NanumSquareRoundR", size: 15)
    }
    private let detailLbl = UILabel().then {
        $0.textColor = .black
        $0.font = UIFont(name: "NanumSquareRoundR", size: 15)
    }
    private let shopImage = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(profileImage)
        view.addSubview(shopName)
        view.addSubview(heartLbl)
        view.addSubview(heartNumLbl)
        view.addSubview(introduceLbl)
        view.addSubview(detailLbl)
        view.addSubview(shopImage)
    }
    
    func constantraint() {
        profileImage.snp.makeConstraints { (make) in
            make.top.equalTo(view.frame.height/15)
            make.leading.equalTo(30)
        }
        shopName.snp.makeConstraints{ (make) in
            make.top.equalTo(view.frame.height/15)
            make.leading.equalTo(profileImage.snp.trailing).offset(20)
            make.trailing.equalTo(-30)
        }
        heartLbl.snp.makeConstraints{ (make) in
            make.top.equalTo(shopName.snp.bottom).offset(20)
            make.leading.equalTo(profileImage.snp.trailing).offset(20)
        }
        heartNumLbl.snp.makeConstraints{ (make) in
            make.top.equalTo(shopName.snp.bottom).offset(20)
            make.leading.equalTo(heartLbl.snp.trailing).offset(15)
            make.trailing.equalTo(-130)
        }
        introduceLbl.snp.makeConstraints{ (make) in
            make.top.equalTo(profileImage.snp.bottom).offset(25)
            make.leading.equalTo(30)
            make.trailing.equalTo(-30)
        }
        detailLbl.snp.makeConstraints{ (make) in
            make.top.equalTo(introduceLbl.snp.bottom).offset(25)
            make.leading.equalTo(30)
            make.trailing.equalTo(-30)
        }
        
    }
    
    
}


