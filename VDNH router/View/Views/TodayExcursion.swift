//
//  TodayExcursionView.swift
//  VDNH router
//
//  Created by Anatoliy Podkladov on 04.11.2022.
//

import SwiftUI

let todayExcursionItems: [Excursion] = [
    Excursion(title: "Школа дружбы: как узнать ВДНХ", image: "iconTodayExcursion_1", type: .excourse, startTime: "Через 40 минут"),
    Excursion(title: "Экскурсии «Интеллектуальная прогулка по ВДНХ»", image: "iconTodayExcursion_2", type: .excourse),
    Excursion(title: "Экскурсии «Путешествие во времени. ВДНХ. Сквозь годы и эпохи»", image: "iconTodayExcursion_3", type: .excourse, startTime: "Завтра с 10:30"),
]

struct TodayExcursionView: View {
    
    let item: Excursion
    
    var body: some View {
        
        Button {
            print("Arrow button presed")
        } label: {
            
            HStack(spacing: 20) {
                
                ImageView(name: item.image, size: .huge, renderingMode: .original)
                
                VStack(alignment: .leading, spacing: 6) {
                    
                    Text(item.title)
                        .font(.captionTextSemiBold)
                        .foregroundColor(.white100)
                        .multilineTextAlignment(.leading)
                    
                    if let startTime = item.startTime {
                        
                        Text(startTime)
                            .font(.captionSmallTextSemiBold)
                            .foregroundColor(Color.greenTime)
                        
                    }
                    
                }
                
                Spacer()
                
                ImageView(name: "iconArrowButton", width: 4.67, height: 8, renderingMode: .original)
                
            }
            
        }
        .frame(width: screenWidth - 48, height: 80)
//        .background(Color.cardCellBackground)
//        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
        
    }
    
    private var screenWidth: CGFloat { UIScreen.main.bounds.size.width }
    
}

struct TodayExcursionView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        TodayExcursionView(
            item: Excursion(title: "Экскурсии «Путешествие во времени. ВДНХ. Сквозь годы и эпохи»", image: "iconTodayExcursion_3", type: .excourse, startTime: "Завтра с 10:30")
        )
        
    }
    
}
