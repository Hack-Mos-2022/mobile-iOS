//
//  ExcursionView.swift
//  VDNH router
//
//  Created by Anatoliy Podkladov on 04.11.2022.
//

import SwiftUI

struct ExcursionView: View {
    
    let excursion: Excursion
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            
            VStack {
                
                HStack {
                    
                    Text(excursion.type?.rawValue ?? "")
                        .font(.captionSmallTextSemiBold)
                        .foregroundColor(.white100)
                        .padding(.horizontal, 10)
                        .frame(height: 26)
                        .background(Color.black60)
                        .clipShape(RoundedRectangle(cornerRadius: 13, style: .continuous))
                    
                    Spacer()
                    
                    Button {
                        print("Add favorite")
                        //                            excursion.isLiked.toggle()
                    } label: {
                        ImageView(
                            name: excursion.isLiked ? "iconAddFavoritesActiveButton" : "iconAddFavoritesInactiveButton",
                            width: 37, height: 28,
                            renderingMode: .original
                        )
                    }
                    
                }
                .padding(.horizontal, 20)
                
                Spacer()
                
            }
            .padding(.top, 17)
            .background {
                Image(excursion.image)
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .aspectRatio(contentMode: .fill)
            }
            
            HStack {
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    Text(excursion.title)
                        .font(.captionTextSemiBold)
                        .foregroundColor(Color.white100)
                    
                    Text(excursion.subtitle)
                        .font(.textLarge)
                        .foregroundColor(.white100)
                    
                }
                
            }
            .padding(.top, 16)
            .padding(.horizontal, 20)
            .padding(.bottom, 21)
            
        }
        .frame(width: screenWidth - 48, height: 500)
        .background(Color.cardCellBackground)
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
        
    }
    
    private var screenWidth: CGFloat { UIScreen.main.bounds.size.width }
    
}

struct ExcursionView_Previews: PreviewProvider {
    static var previews: some View {
        ExcursionView(
            excursion: Excursion(title: "«Классная программа»", subtitle: "Занятия для учеников 1-11 классов", image: "image_1", type: .excourse, isLiked: true))
    }
}
