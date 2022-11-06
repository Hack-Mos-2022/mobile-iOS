//
//  YoullLikedItView.swift
//  VDNH router
//
//  Created by Anatoliy Podkladov on 04.11.2022.
//

import SwiftUI

let youllLikedItItems: [YoullLikedIt] = [
    YoullLikedIt(title: "Семейный отдых", type: .education, imageName: "YoullLikedItImage_1", placeCount: 13, action: { }),
    YoullLikedIt(title: "Активный отдых", type: .quest, imageName: "YoullLikedItImage_2", placeCount: 9, action: { }),
    YoullLikedIt(title: "Тропы здоровья", type: .outdoors, imageName: "YoullLikedItImage_3", placeCount: 5, action: { }),
]

struct YoullLikedItView: View {
    
    let item: YoullLikedIt
    var width: CGFloat = UIScreen.main.bounds.size.width - 48
    var height: CGFloat = 207
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            
            VStack {
                
                HStack {
                    
                    if let type = item.type?.rawValue {
                        
                        Text(type)
                            .font(.captionSmallTextSemiBold)
                            .foregroundColor(.white100)
                            .padding(.horizontal, 10)
                            .frame(height: 26)
                            .background(Color.black60)
                            .clipShape(RoundedRectangle(cornerRadius: 13, style: .continuous))
                        
                    }
                    
                    if let count = item.allCount {
                        HStack {
                            Text("\(count)")
                                .font(.headline3Semibold)
                                .foregroundColor(.white100)
                        }
                        .padding(.vertical, 16)
                        .padding(.horizontal, 12)
                        .background(Color.black45)
                        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                    }
                    
                    Spacer()
                    
                }
                
                Spacer()
                
                HStack {
                    
                    VStack(alignment: .leading, spacing: 5) {
                        
                        if let count = item.placeCount {
                            
                            Text("\(count) \(item.placeCountText ?? "мест")")
                                .font(.textLarge)
                                .foregroundColor(.white100)
                                .shadow(color: .black90, radius: 3, x: 0, y: 0)
                            
                        }
                        
                        HStack {
                            
                            Text(item.title)
                                .font(.captionTextSemiBold)
                                .foregroundColor(Color.white100)
                                .shadow(color: .black90, radius: 3, x: 0, y: 0)
                            
                            Spacer()
                            
                            if item.imageName == "" {
                                
                                ImageView(name: "iconArrowButton", width: 4.67, height: 8, renderingMode: .original)
                                
                            }
                            
                        }
                        
                    }
                    
                    Spacer()
                    
                }
                .padding(.bottom, 21)
                
                
            }
            .padding(.top, 17)
            .padding(.horizontal, 20)
            .background {
                Image(item.imageName)
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .aspectRatio(contentMode: .fill)
            }
            
        }
        .frame(width: width, height: height)
        .background(Color.cardCellBackground)
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
        
    }
    
}

struct YoullLikedItView_Previews: PreviewProvider {
    
    private static var screenWidth: CGFloat { UIScreen.main.bounds.size.width }
    private static var bottomCellsWidth: CGFloat { (screenWidth - 48 - 11) / 2 }
    
    static var previews: some View {
        
        YoullLikedItView(
            item: YoullLikedIt(title: "Все советы", allCount: 22, imageName: "", action: { }),
            width: bottomCellsWidth,
            height: 183
        )
        
    }
    
}
