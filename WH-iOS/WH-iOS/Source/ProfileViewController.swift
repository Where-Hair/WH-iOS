//
//  ProfileViewController.swift
//  WH-iOS
//
//  Created by 문지수 on 2021/04/15.
//

import Foundation

import RxSwift
import RxCocoa
import SnapKit
import Then

class ProfileViewController: UIViewController {
    
    private let profileImage = UIImageView().then {
        $0.clipsToBounds = true
        $0.layer.borderColor = UIColor.black.cgColor
    }
    private let nickNameLbl = UILabel()
    private let changeBtn = UIButton().then {
        $0.setTitle("변경하기", for: .normal)
        $0.setTitleColor(.mainColor, for: .normal)
        $0.titleLabel?.font = UIFont(name: "NanumSquareRoundR", size: 25)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(profileImage)
        view.addSubview(nickNameLbl)
        view.addSubview(changeBtn)
        
        constantraint()
    }
    
    private func constantraint() {
        profileImage.snp.makeConstraints { (make) in
            make.centerX.equalTo(view)
            make.top.equalTo(view.frame.height/8)
            make.width.height.equalTo(150)
        }
        nickNameLbl.snp.makeConstraints { (make) in
            make.centerX.equalTo(view)
            make.top.equalTo(profileImage.snp.bottom).offset(25)
            make.leading.equalTo(50)
            make.trailing.equalTo(-50)
        }
        changeBtn.snp.makeConstraints { (make) in
            make.centerX.equalTo(view)
            make.top.equalTo(nickNameLbl.snp.bottom).offset(45)
            make.leading.equalTo(50)
            make.trailing.equalTo(-50)
        }
    }
    
}
