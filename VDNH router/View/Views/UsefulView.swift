//
//  UsefulView.swift
//  VDNH router
//
//  Created by Anatoliy Podkladov on 04.11.2022.
//

import SwiftUI

let usefulEventItems: [Excursion] = [
    Excursion(title: "Продолжайте изучать\nВДНХ", subtitle: "Игра", image: "imageGameRoute", type: .level),
    Excursion(
        title: "Программа лояльности\n«Друзья ВДНХ»",
        subtitle: "Выгода!",
        subtitleColor: .white50,
        image: "imageLoyaltyProgram",
        topText: "Серебряный статус"
    ),
    Excursion(
        title: "Сувениры и\nподарки",
        titleColor: .white100,
        subtitle: "Выгода!",
        subtitleColor: .white90,
        image: "imageSouvenirBuy",
        topText: "Воспоминания и впечатления"
    )
]

struct UsefulView: View {
    
    let excursion: Excursion
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            
            VStack {
                
                HStack {
                    
                    if let level = excursion.type?.rawValue {
                        
                        Text(level)
                            .font(.captionSmallTextSemiBold)
                            .foregroundColor(.white100)
                            .padding(.horizontal, 10)
                            .frame(height: 26)
                            .background(Color.black60)
                            .clipShape(RoundedRectangle(cornerRadius: 13, style: .continuous))
                        
                    } else if let topText = excursion.topText {
                        
                        Text(topText)
                            .font(.captionSmallTextSemiBold)
                            .foregroundColor(excursion.titleColor)
                        
                    }
                    
                    Spacer()
                    
                }
                
                Spacer()
                
                HStack {
                    
                    VStack(alignment: .leading, spacing: 10) {
                        
                        Text(excursion.subtitle)
                            .font(.captionTextSemiBold)
                            .foregroundColor(excursion.subtitleColor)
                        
                        Text(excursion.title)
                            .font(.textLarge)
                            .foregroundColor(excursion.titleColor)
                        
                    }
                    
                    Spacer()
                    
                }
                
            }
            .padding(.vertical, 22)
            .padding(.horizontal, 24)
            .background {
                Image(excursion.image)
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .aspectRatio(contentMode: .fill)
            }
            
            
        }
        .frame(width: screenWidth - 48, height: 428)
        .background(Color.cardCellBackground)
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
        
    }
    
    private var screenWidth: CGFloat { UIScreen.main.bounds.size.width }
    
}

struct UsefulView_Previews: PreviewProvider {
    static var previews: some View {
        UsefulView(
            excursion: Excursion(title: "Сувениры и\nподарки", titleColor: .white100, subtitle: "Выгода!",  subtitleColor: .white90, image: "imageSouvenirBuy", topText: "Воспоминания и впечатления")
        )
    }
}
