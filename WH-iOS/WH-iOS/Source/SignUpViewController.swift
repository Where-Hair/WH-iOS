//
//  SignUpViewController.swift
//  WH-iOS
//
//  Created by 문지수 on 2021/03/25.
//

import UIKit

import RxSwift
import RxCocoa
import SnapKit
import Then

class SignUpViewController: UIViewController {
    
    //UI
    private let textLogo = UIImageView().then {
        $0.image = UIImage(named: "text_Logo")
    }
    private let nicknameLbl = UILabel().then {
        $0.text = "닉네임"
        $0.textColor = .black
        $0.font = UIFont(name: "NanumSquareRoundR", size: 17)
    }
    private let idLbl = UILabel().then {
        $0.text = "아이디"
        $0.textColor = .black
        $0.font = UIFont(name: "NanumSquraeRoundR", size: 17)
    }
    private let passwordLbl = UILabel().then {
        $0.text = "비밀번호"
        $0.textColor = .black
        $0.font = UIFont(name: "NanumSquareRoundR", size: 17)
    }
    private let nicknameTxtField = UITextField().then {
        $0.placeholder = "nickname"
        $0.font = UIFont(name: "NanumSquareRoundR", size: 17)
        $0.layer.cornerRadius = 25
        $0.backgroundColor = .white
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
    private let signUpBtn = UIButton().then {
        $0.clipsToBounds = true
        $0.setTitle("회원가입", for: .normal)
        $0.setTitleColor(.mainColor, for: .normal)
    }
    private let signInBtn = UIButton().then {
        $0.clipsToBounds = true
        $0.setTitle("이미 계정이 있으신가요?", for: .normal)
        $0.setTitleColor(.black, for: .normal)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}
