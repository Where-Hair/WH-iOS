//
//  SignInViewController.swift
//  WH-iOS
//
//  Created by 문지수 on 2021/03/25.
//

import UIKit

import RxSwift
import RxCocoa
import SnapKit
import Then

class SignInViewController: UIViewController {
    
    //UI
    private let textLogo =  UIImageView().then{
        $0.image = UIImage(named: "text_Logo")
    }
    private let idLbl = UILabel().then {
        $0.text = "아이디"
        $0.textColor = .black
        $0.font = UIFont(name: "NanumSquareRoundR", size: 17)
    }
    private let passwordLbl = UILabel().then {
        $0.text = "비밀번호"
        $0.textColor = .black
        $0.font = UIFont(name: "NanumSquareRoundR", size: 17)
    }
    private let idTxtField = UITextField().then {
        $0.placeholder = "id"
        $0.font = UIFont(name: "NanumSquareRoundR", size: 17)
        $0.layer.cornerRadius = 25
        $0.backgroundColor = .white
    }
    private let passwordTxtField = UITextField().then {
        $0.placeholder = "password"
        $0.font = UIFont(name: "NanumSquareRoundR", size: 17)
        $0.layer.cornerRadius = 25
        $0.backgroundColor = .white
    }
    private let signInBtn = UIButton().then {
        $0.clipsToBounds = true
        $0.setTitle("로그인", for: .normal)
        $0.setTitleColor(.mainColor, for: .normal)
        $0.titleLabel?.font = UIFont(name: "NanumSquareRoundR", size: 25)
    }
    private let signUpBtn = UIButton().then {
        $0.clipsToBounds = true
        $0.setTitle("아직 계정이 없으신가요?", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = UIFont(name: "NanumSquareRoundR", size: 10)
    }
    
    func constraint() {
        textLogo.snp.makeConstraints { (make) in
            make.centerX.equalTo(view)
            make.top.equalTo(view.frame.height/5)
            make.width.height.equalTo(220)
        }
        idLbl.snp.makeConstraints { (make) in
            make.top.equalTo(textLogo.snp.bottom).offset(80)
            make.centerX.equalTo(view)
            make.leading.equalTo(30)
            make.trailing.equalTo(-50)
        }
        idTxtField.snp.makeConstraints { (make) in
            make.top.equalTo(idLbl.snp.bottom).offset(20)
            make.centerX.equalTo(view)
            make.leading.equalTo(30)
            make.trailing.equalTo(-30)
        }
        passwordLbl.snp.makeConstraints{ (make) in
            make.top.equalTo(idTxtField.snp.bottom).offset(40)
            make.centerX.equalTo(view)
            make.leading.equalTo(30)
            make.trailing.equalTo(-30)
        }
        passwordTxtField.snp.makeConstraints { (make) in
            make.top.equalTo(passwordLbl.snp.bottom).offset(20)
            make.centerX.equalTo(view)
            make.leading.equalTo(30)
            make.trailing.equalTo(-30)
        }
        signInBtn.snp.makeConstraints { (make) in
            make.top.equalTo(passwordTxtField.snp.bottom).offset(30)
            make.centerX.equalTo(view)
            make.leading.equalTo(30)
            make.trailing.equalTo(-30)
        }
        signUpBtn.snp.makeConstraints { (make) in
            make.top.equalTo(signInBtn.snp.bottom).offset(10)
            make.centerX.equalTo(view)
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(textLogo)
        view.addSubview(idLbl)
        view.addSubview(idTxtField)
        view.addSubview(passwordLbl)
        view.addSubview(passwordTxtField)
        view.addSubview(signInBtn)
        view.addSubview(signUpBtn)
        
        constraint()
    }
}
