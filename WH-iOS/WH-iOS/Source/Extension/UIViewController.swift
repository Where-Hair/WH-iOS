//
//  UIViewController.swift
//  WH-iOS
//
//  Created by 문지수 on 2021/03/30.
//

import Foundation
import UIKit

extension UIViewController {
    func pushVC(_ identifire: String) {
        let vc = storyboard?.instantiateViewController(identifier: identifire)
        navigationController?.pushViewController(vc!, animated: true)
    }
}
