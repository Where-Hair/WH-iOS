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
    private let profileImage = UIImageView()
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.addSubview(profileImage)
        view.addSubview(profileLbl)
        view.addSubview(storeNameLbl)
        view.addSubview(storeNameTxtFiled)
        view.addSubview(locationLbl)
        view.addSubview(locationTxtField)
        view.addSubview(introductionLbl)
        view.addSubview(introductionTxtField)
        view.addSubview(storeLbl)
        view.addSubview(storeTxtView)
        view.addSubview(photoBtn)
        view.addSubview(photoImage)
        view.addSubview(storeImage)
    }
    

}
