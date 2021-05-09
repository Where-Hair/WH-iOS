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
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileBtn: UIButton!
    @IBOutlet weak var nicknameLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        setUI()
    }
    
    func setUI() {
        profileImage.layer.borderColor = UIColor.black.cgColor
        profileImage.clipsToBounds = true
        
        profileBtn.rx.tap.subscribe(onNext: { _ in
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
        }).disposed(by: disposeBag)
    }
    
    func bindViewModel() {
        
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

