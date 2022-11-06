//
//  Colors.swift
//  VDNH router
//
//  Created by Anatoliy Podkladov on 30.10.2022.
//

import SwiftUI

public extension Color {
    static let mainRed = "EF4850".hexColor
    static let grayBackground = "AAAAAA".hexColor
    static let white100 = "FFFFFF".hexColor
    static let white90 = "E7E7E7".hexColor
    static let white80 = "CFCFCF".hexColor
    static let white70 = "B7B7B7".hexColor
    static let white60 = "A0A0A0".hexColor
    static let white50 = "838383".hexColor
    static let white40 = "707070".hexColor
    static let black30 = "585858".hexColor
    static let black40 = "3A3A3A".hexColor
    static let black45 = "343434".hexColor
    static let black50 = "292929".hexColor
    static let black60 = "202020".hexColor
    static let black70 = "141414".hexColor
    static let black80 = "111111".hexColor
    static let black90 = "0C0C0C".hexColor
    static let black100 = "000000".hexColor
    static let mainBaground = "141414".hexColor
    
    static let greenTime = "EFC048".hexColor
    
    static let cardCellBackground = black50
}

extension UIColor {
    
    static let white40 = "707070".hexadecimalColor
}

public extension String {
    
    var hexadecimalColor: UIColor {
        return UIColor(hexadecimalColor: self)
    }
    
    var hexColor: Color {
        return Color(UIColor(hexadecimalColor: self))
    }
    
}

public extension UIColor {
    convenience init(hexadecimalColor: String) {
        let hex = hexadecimalColor.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        guard let int = Scanner(string: hex).scanInt32(representation: .hexadecimal) else {
            self.init(
                displayP3Red: 1,
                green: 1,
                blue: 1,
                alpha: 1
            )
            return
        }
        
        let a, r, g, b: Int32
        switch hex.count {
        case 3:     (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)  // RGB (12-bit)
        case 6:     (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)                    // RGB (24-bit)
        case 8:     (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)       // ARGB (32-bit)
        default:    (a, r, g, b) = (255, 0, 0, 0)
        }

        self.init(
            displayP3Red: CGFloat(r) / 255,
            green: CGFloat(g) / 255,
            blue: CGFloat(b) / 255,
            alpha: CGFloat(a) / 255
        )
    }

    enum ColorType {
        case gray
        case darkGray
        case strongGray
        case red
        case white
        case black
        case lightGray
        case pink
        case blue
    }

    convenience init(_ colorType: ColorType) {
        switch colorType {
        case .gray:
            self.init(hexadecimalColor: "8C8C8C")
        case .strongGray:
            self.init(hexadecimalColor: "555555")
        case .darkGray:
            self.init(hexadecimalColor: "6C6C6C")
        case .red:
            self.init(hexadecimalColor: "DB1D5F")
        case .white:
            self.init(hexadecimalColor: "FDFEFE")
        case .black:
            self.init(hexadecimalColor: "000000")
        case .lightGray:
            self.init(hexadecimalColor: "E3E5E5")
        case .pink:
            self.init(hexadecimalColor: "C550DC")
        case .blue:
            self.init(hexadecimalColor: "007AFF")
        }
    }
}
