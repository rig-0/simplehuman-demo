//
//  UIColor+AppColors.swift
//  ©️ 2023 0100
//

import UIKit

extension UIColor {
    
    convenience init(rgb: (CGFloat, CGFloat, CGFloat), alpha: CGFloat = 1) {
        self.init(red: rgb.0/255, green: rgb.1/255, blue: rgb.2/255, alpha: alpha)
    }

    static var random: UIColor {
        return UIColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 1.0
        )
    }
}

extension UIColor {
    struct App {
        static var purple: UIColor { return UIColor(rgb: (177, 147, 193)) }
    }
}
