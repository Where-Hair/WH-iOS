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
    }
    private let signUpBtn = UIButton().then {
        $0.clipsToBounds = true
        $0.setTitle("아직 계정이 없으신가요?", for: .normal)
        $0.setTitleColor(.black, for: .normal)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}
