//
//  ProfileViewController.swift
//  WH-iOS
//
//  Created by 문지수 on 2021/04/21.
//

import Foundation

import RxSwift
import RxCocoa
import SnapKit
import Then

class ProfileViewController: UIViewController {
    
    private let disposeBag = DisposeBag()
    private let viewModel = ProfileViewModel()
    
    private let loadData = BehaviorRelay<Void>(value: ())
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileBtn: UIButton!
    @IBOutlet weak var nicknameLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        setUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        loadData.accept(())
    }
    
    func setUI() {
        profileImage.layer.cornerRadius = profileImage.frame.height/2
        profileImage.layer.borderWidth = 0.8
        profileImage.layer.borderColor = UIColor.black.cgColor
        
        profileBtn.rx.tap.subscribe(onNext: { _ in
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
        }).disposed(by: disposeBag)
    }
    
    func bindViewModel() {
        let input = ProfileViewModel.Input(loadData: loadData.asSignal(onErrorJustReturn: ()))
        let output = viewModel.transform(input: input)
        
        output.loadData.bind{ [unowned self] result in
            profileImage.image? = UIImage(named: result?.profileImage ?? "") ?? UIImage(named: "profile") as! UIImage
            nicknameLbl.text = result?.nickname
        }.disposed(by: disposeBag)
    }
    
}

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            profileImage.image = image
        }
        dismiss(animated: true, completion: nil)
    }
}

