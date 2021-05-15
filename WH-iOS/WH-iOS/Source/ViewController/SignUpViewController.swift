//
//  SignUpViewController.swift
//  WH-iOS
//
//  Created by 문지수 on 2021/04/01.
//

import UIKit

import RxSwift
import RxCocoa
import SnapKit
import Then

class SignUpViewController: UIViewController {
    
    private let disposeBag = DisposeBag()
    private let viewModel = SignUpViewModel()
    
    //UI
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var nicknameLbl: UILabel!
    @IBOutlet weak var nicknameTxtField: UITextField!
    @IBOutlet weak var idLbl: UILabel!
    @IBOutlet weak var idTxtField: UITextField!
    @IBOutlet weak var passwordLbl: UILabel!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var signInBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordTxtField.isSecureTextEntry = true
        
        bindViewModel()
        setUI()
    }
    
    func setUI() {
        signUpBtn.rx.tap.subscribe(onNext: { _ in
            self.alert("성공", "회원가입에 성공하였습니다")
        }).disposed(by: disposeBag)
        
        signInBtn.rx.tap.subscribe(onNext: { _ in
            self.pushVC("signInVC")
        }).disposed(by: disposeBag)
        
        signUpBtn.layer.cornerRadius = 15
        nicknameTxtField.underLine()
        idTxtField.underLine()
        passwordTxtField.underLine()
    }
    
    //bind
    func bindViewModel() {
        let input = SignUpViewModel.Input(nickname: nicknameTxtField.rx.text.orEmpty.asDriver(),
                                          id: idTxtField.rx.text.orEmpty.asDriver(),
                                          password: passwordTxtField.rx.text.orEmpty.asDriver(),
                                          doneTap: signUpBtn.rx.tap.asDriver())
        let output = viewModel.transform(input: input)
        
        output.isEnable.drive(signUpBtn.rx.isEnabled).disposed(by: disposeBag)
        output.result.emit(onNext: { _ in
            self.pushVC("signInVC")
        }).disposed(by: disposeBag)
    }
    

}
