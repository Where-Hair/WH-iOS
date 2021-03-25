//
//  UIColor.swift
//  WH-iOS
//
//  Created by 문지수 on 2021/03/24.
//

import UIKit

extension UIColor {
    static func rgb(red: Int, green: Int, blue: Int, alpha: CGFloat) -> UIColor {
        return .init(red: CGFloat(red) / 255, green: CGFloat(green) / 255, blue: CGFloat(blue) / 255, alpha: alpha)
    }
    
    static var mainColor: UIColor {
        return rgb(red: 204, green: 153, blue: 255, alpha: 1)
    }
    
}
