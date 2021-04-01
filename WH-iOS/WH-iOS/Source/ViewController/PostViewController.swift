//
//  PostViewController.swift
//  WH-iOS
//
//  Created by 문지수 on 2021/04/01.
//

import UIKit

import RxSwift
import RxCocoa
import SnapKit
import Then

class PostViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private let postView = UIView()
    private let profileImage = UIImageView().then {
        $0.clipsToBounds = true
    }
    private let profileLbl = UILabel().then {
        $0.text = "프로필 사진"
        $0.textColor = .black
        $0.font = UIFont(name: "NanumSquraeRoundR", size: 17)
    }
    private let storeNameLbl = UILabel().then {
        $0.text = "가계명"
        $0.textColor = .black
        $0.font = UIFont(name: "NanumSquraeRoundR", size: 17)
    }
    private let storeNameTxtFiled = UITextField().then {
        $0.placeholder = "가게명"
        $0.font = UIFont(name: "NanumSquareRoundR", size: 17)
        $0.underLine()
    }
    private let locationLbl = UILabel().then {
        $0.text = "위치(ㅇㅇ구 ㅇㅇ동)"
        $0.textColor = .black
        $0.font = UIFont(name: "NanumSquareRoundR", size: 17)
    }
    private let locationTxtField = UITextField().then {
        $0.placeholder = "가게명"
        $0.font = UIFont(name: "NanumSquareRoundR", size: 17)
        $0.underLine()
    }
    private let introductionLbl = UILabel().then {
        $0.text = "한줄소개"
        $0.textColor = .black
        $0.font = UIFont(name: "NanumSquraeRoundR", size: 17)
    }
    private let introductionTxtField = UITextField().then {
        $0.placeholder = "한줄소개"
        $0.font = UIFont(name: "NanumSquareRoundR", size: 17)
        $0.underLine()
    }
    private let storeLbl = UILabel().then {
        $0.text = "가게 정보"
        $0.textColor = .black
        $0.font = UIFont(name: "NanumSquareRoundR", size: 17)
    }
    private let storeTxtView = UITextView()
    private let photoImage = UIImageView().then {
        $0.image = UIImage(named: "library")
    }
    private let photoBtn = UIButton().then {
        $0.setTitle("사진 선택하기", for: .normal)
        $0.setTitleColor(.black, for: .normal)
    }
    private let storeImage = UIImageView()
    private let okBtn = UIButton().then {
        $0.setTitle("등록", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .mainColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        postView.addSubview(profileImage)
        postView.addSubview(profileLbl)
        postView.addSubview(storeNameLbl)
        postView.addSubview(storeNameTxtFiled)
        postView.addSubview(locationLbl)
        postView.addSubview(locationTxtField)
        postView.addSubview(introductionLbl)
        postView.addSubview(introductionTxtField)
        postView.addSubview(storeLbl)
        postView.addSubview(storeTxtView)
        postView.addSubview(photoBtn)
        postView.addSubview(photoImage)
        postView.addSubview(storeImage)
        postView.addSubview(okBtn)
        
        constantraint()
    }
    

    func constantraint() {
        profileImage.snp.makeConstraints { (make) in
            make.centerY.equalTo(view)
            make.top.equalTo(view.frame.height/5)
            make.width.height.equalTo(150)
        }
        profileLbl.snp.makeConstraints { (make) in
            make.centerY.equalTo(view)
            make.top.equalTo(profileImage.snp.bottom).offset(10)
        }
        storeNameLbl.snp.makeConstraints { (make) in
            make.centerX.equalTo(view)
            make.top.equalTo(profileLbl.snp.bottom).offset(40)
            make.leading.equalTo(30)
            make.trailing.equalTo(-50)
        }
        storeNameTxtFiled.snp.makeConstraints { (make) in
            make.centerX.equalTo(view)
            make.top.equalTo(storeNameLbl.snp.bottom).offset(20)
            make.leading.equalTo(30)
            make.trailing.equalTo(-30)
        }
        locationLbl.snp.makeConstraints { (make) in
            make.centerX.equalTo(view)
            make.top.equalTo(storeNameTxtFiled.snp.bottom).offset(30)
            make.leading.equalTo(30)
            make.trailing.equalTo(-50)
        }
        locationTxtField.snp.makeConstraints { (make) in
            make.centerX.equalTo(view)
            make.top.equalTo(locationLbl.snp.bottom).offset(20)
            make.leading.equalTo(30)
            make.trailing.equalTo(-30)
        }
        introductionLbl.snp.makeConstraints { (make) in
            make.centerX.equalTo(view)
            make.top.equalTo(locationTxtField.snp.bottom).offset(30)
            make.leading.equalTo(30)
            make.trailing.equalTo(-50)
        }
        introductionTxtField.snp.makeConstraints { (make) in
            make.centerX.equalTo(view)
            make.top.equalTo(introductionLbl.snp.bottom).offset(20)
            make.leading.equalTo(30)
            make.trailing.equalTo(-30)
        }
        storeLbl.snp.makeConstraints { (make) in
            make.centerX.equalTo(view)
            make.top.equalTo(introductionTxtField.snp.bottom).offset(30)
            make.leading.equalTo(30)
            make.trailing.equalTo(-50)
        }
        storeTxtView.snp.makeConstraints { (make) in
            make.centerX.equalTo(view)
            make.top.equalTo(storeLbl.snp.bottom).offset(20)
            make.leading.equalTo(30)
            make.trailing.equalTo(-30)
        }
        photoImage.snp.makeConstraints { (make) in
            make.centerX.equalTo(view)
            make.top.equalTo(storeTxtView.snp.bottom).offset(30)
            make.leading.equalTo(30)
        }
        photoBtn.snp.makeConstraints{ (make) in
            make.centerX.equalTo(view)
            make.leading.equalTo(photoImage.snp.right).offset(7)
            make.top.equalTo(storeTxtView.snp.bottom).offset(13)
        }
        storeImage.snp.makeConstraints { (make) in
            make.centerX.equalTo(view)
            make.top.equalTo(photoBtn.snp.bottom).offset(30)
            make.bottom.equalTo(okBtn.snp.top).offset(40)
            make.leading.equalTo(30)
            make.trailing.equalTo(-30)
        }
        okBtn.snp.makeConstraints { (make) in
            make.centerX.equalTo(view)
            make.bottom.equalTo(view.frame.height/5)
            make.leading.equalTo(50)
            make.trailing.equalTo(-50)
        }
        
    }
    

}
