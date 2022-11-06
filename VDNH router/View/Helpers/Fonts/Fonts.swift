//
//  Fonts.swift
//  VDNH router
//
//  Created by Anatoliy Podkladov on 30.10.2022.
//

import SwiftUI

public extension Font {
    
    static let headline0 = gilroyBold(size: .xxxl)
    static let headline1 = gilroyBold(size: .xxl)
    static let headline2 = gilroyBold(size: .xl)
    static let headline3 = gilroyBold(size: .l)
    static let headline4 = gilroyBold(size: .m)
    
    static let headline3Semibold = gilroySemiBold(size: .l)
    
    static let bigParagraphsRegular = gilroyRegular(size: .s)
    static let bigParagraphsSemiBold = gilroySemiBold(size: .s)
    
    static let textLarge = gilroyBold(size: .xs)
    static let textNormal = gilroyMedium(size: .xxs)
    static let textBold = gilroySemiBold(size: .xxs)
    
    static let captionText = gilroyRegular(size: .xxxs)
    static let captionTextSemiBold = gilroySemiBold(size: .xxxs)
    
    static let captionSmallTextBold = gilroyBold(size: .xxxxs)
    static let captionSmallTextSemiBold = gilroySemiBold(size: .xxxxs)
    static let captionMediumNormal = gilroyMedium(size: .xxxxs)
                    
    static let hairlineLarge = gilroyBold(size: .xxs)
    static let hairlineSmall = gilroyBold(size: .xxxxs)
    
    static let buttonDefault = gilroyBold(size: .xxs)
    static let buttonSmall = gilroyBold(size: .xxxs)
    
    // Model
    
    enum Size: CGFloat {
        case xxxxs = 12
        case xxxs = 14
        case xxs = 16
        case xs = 18
        case s = 24
        case m = 32
        case l = 36
        case xl = 40
        case xxl = 48
        case xxxl = 64
    }
    
    // Private methods
    
    private static func gilroyBold(size: Size) -> Font { Font.custom("Gilroy", size: size.rawValue).weight(.bold) }
    private static func gilroySemiBold(size: Size) -> Font { Font.custom("Gilroy-SemiBold", size: size.rawValue) }
    private static func gilroyMedium(size: Size) -> Font { Font.custom("Gilroy-Medium", size: size.rawValue) }
    private static func gilroyRegular(size: Size) -> Font { Font.custom("Gilroy-Regular", size: size.rawValue) }
    
//    static let buttonTitle = Font.system(size: 17, weight: .semibold)
//
//    // Regular
//
//    static let regular10 = Font.system(size: 10, weight: .regular)
//    static let regular12 = Font.system(size: 12, weight: .regular)
//    static let regular14 = Font.system(size: 14, weight: .regular)
//
//    // Semibold
//
//    static let semibold10 = Font.system(size: 10, weight: .semibold)
//    static let semibold12 = Font.system(size: 12, weight: .semibold)
//    static let semibold14 = Font.system(size: 14, weight: .semibold)
//    static let semibold16 = Font.system(size: 16, weight: .semibold)
//    static let semibold20 = Font.system(size: 20, weight: .semibold)
//    static let semibold22 = Font.system(size: 22, weight: .semibold)
//    static let semibold24 = Font.system(size: 24, weight: .semibold)
//
//
//    static let subheadlineRegular = Font.system(size: 17, weight: .regular)
//    static let sunbheadlineBold = Font.system(size: 17, weight: .bold)
//
//    // Bold
//
//    static let bold = Font.system(size: 12, weight: .bold)
//    static let bold24 = Font.system(size: 24, weight: .bold)
//    static let bold34 = Font.system(size: 34, weight: .bold)
}

//public extension UIFont {
//
//    // Bold
//
//    static let bold12 = UIFont.boldSystemFont(ofSize: 12)
//
//}
