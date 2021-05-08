//
//  SignInViewController.swift
//  WH-iOS
//
//  Created by 문지수 on 2021/04/01.
//

import UIKit

import RxSwift
import RxCocoa
import SnapKit
import Then

class SignInViewController: UIViewController {
    
    private let disposeBag = DisposeBag()
    private let viewModel = SignInViewModel()
    
    //UI
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var idTxtField: UITextField!
    @IBOutlet weak var idLbl: UILabel!
    @IBOutlet weak var passwordLbl: UILabel!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var signInBtn: UIButton!
    @IBOutlet weak var signUpBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bindViewModel()
        setUI()
    }
    
    func setUI() {
        passwordTxtField.isSecureTextEntry = true
        signInBtn.layer.cornerRadius = 15
        signInBtn.setTitleColor(UIColor.white, for: .normal)
        idTxtField.underLine()
        passwordTxtField.underLine()
    }
    
    func bindViewModel() {
        let input = SignInViewModel.Input(id: idTxtField.rx.text.orEmpty.asDriver(),
                                          password: passwordTxtField.rx.text.orEmpty.asDriver(),
                                          doneTap: signInBtn.rx.tap.asDriver())
        let output = viewModel.transform(input: input)
        
        output.isEnalbe.drive(signInBtn.rx.isEnabled).disposed(by: disposeBag)
        output.result.emit(onNext: { _ in
            self.pushVC("mainVC")
        }).disposed(by: disposeBag)
    }
    
    
    
}
