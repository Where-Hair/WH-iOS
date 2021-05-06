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
import KMPlaceholderTextView

class PostViewController: UIViewController {
    
    private let disposeBag = DisposeBag()
    private let viewModel = PostViewModel()
    
    private let postImage = BehaviorRelay<Data?>(value: nil)
    
    @IBOutlet weak var storeNameLbl: UILabel!
    @IBOutlet weak var storeNameTxtField: UITextField!
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var locationTxtField: UITextField!
    @IBOutlet weak var introduceLbl: UILabel!
    @IBOutlet weak var introduceTxtField: UITextField!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var descriptionTxtView: KMPlaceholderTextView!
    @IBOutlet weak var storeBtn: UIButton!
    @IBOutlet weak var storeImage: UIImageView!
    @IBOutlet weak var addBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        setUI()
    }
    
    func setUI() {
        storeBtn.rx.tap.subscribe(onNext: { _ in
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
        }).disposed(by: disposeBag)
    }
    
    func bindViewModel() {
        let input = PostViewModel.Input(isName: storeNameTxtField.rx.text.orEmpty.asDriver(),
                                        isLocation: locationTxtField.rx.text.orEmpty.asDriver(),
                                        isIntroduce: introduceTxtField.rx.text.orEmpty.asDriver(),
                                        isInformation: descriptionTxtView.rx.text.orEmpty.asDriver(),
                                        isImg: postImage.asDriver(onErrorJustReturn: nil),
                                        postTap: addBtn.rx.tap.asDriver())
        let output = viewModel.transform(input: input)
        
        output.result.emit(onCompleted: {[unowned self] in
            pushVC("mainVC")
        }).disposed(by: disposeBag)
        
        output.isEnable.drive(addBtn.rx.isEnabled).disposed(by: disposeBag)

    }

}

extension PostViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            storeImage.image = image
        }
        dismiss(animated: true, completion: nil)
    }
}

