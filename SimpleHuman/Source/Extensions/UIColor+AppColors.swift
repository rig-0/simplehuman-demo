//
//  UIColor+AppColors.swift
//  ©️ 2023 0100
//

import UIKit

extension UIColor {
    
    convenience init?(hex: String?) {
        guard let hex = hex else { return nil }
        
        let r, g, b, a: CGFloat
        
        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])
            
            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    a = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    r = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    g = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    b = CGFloat(hexNumber & 0x000000ff) / 255
                    
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        
        return nil
    }

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
