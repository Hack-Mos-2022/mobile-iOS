//
//  TopFoodPlacesView.swift
//  VDNH router
//
//  Created by Anatoliy Podkladov on 04.11.2022.
//

import SwiftUI

let topFoodPlacesItems: [FoodPlace] = [
    FoodPlace(title: "Оттепель", placeType: .restaurant, imageName: "imageRestaurantOttepel", rating: 4.7, reviewsCount: 1776, action: { }),
    FoodPlace(title: "Bro Bar", placeType: .bar, imageName: "imageBarBroBar", rating: 5, reviewsCount: 136, action: { }),
]

struct TopFoodPlacesView: View {
    
    let items: [FoodPlace]
    
    var body: some View {
        
            HStack(spacing: 11) {
                
                if let item = items.first {
                    
                    FoodView(item: item)
                    
                }
                
                if let item = items.last {
                    
                    FoodView(item: item)
                    
                }
                
            }
//            .padding(.horizontal, 24)
            
    }
    
}

struct FoodView: View {
    
    let item: FoodPlace
    
    private var screenWidth: CGFloat { UIScreen.main.bounds.size.width }
    private var width: CGFloat { (screenWidth - 48 - 11) / 2 }
    private var height: CGFloat { (screenWidth - 48 - 11) / 2 }
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            
            VStack {
                
                HStack {
                    
                    if let rating = item.ratingString, let reviewsCount = item.reviewsCount {
                        
                        VStack {
                            
                            HStack(spacing: 5) {
                                
                                ImageView(
                                    name: "iconRatingStar",
                                    size: .md,
                                    renderingMode: .original
                                )
                                
                                Text("\(rating) (\(reviewsCount))")
                                    .font(.captionSmallTextSemiBold)
                                    .foregroundColor(.white100)
                                
                            }
                            .frame(height: 25)
                            .padding(.horizontal, 6)
                            .background(Color.black50)
                            .clipShape(RoundedRectangle(cornerRadius: 6, style: .continuous))
                            
                            Spacer()
                            
                        }
                        
                        Spacer()
                        
                    }
                    
                }
                
            }
            .padding(.horizontal, 10)
            .padding(.top, 10)
            .background {
                Image(item.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
            .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
            
            HStack {
                
                VStack(alignment: .leading, spacing: 5) {
                    
                    Text(item.title)
                        .font(.textLarge)
                        .foregroundColor(.white100)
                        .shadow(color: .black90, radius: 3, x: 0, y: 0)
                    
                    
                    Text(item.placeType.rawValue)
                        .font(.captionMediumNormal)
                        .foregroundColor(.white70)
                        .shadow(color: .black90, radius: 3, x: 0, y: 0)
                    
                }
                
                Spacer()
                
            }
            .padding(.top, 7)
            .padding(.bottom, 9)
            .padding(.horizontal, 10)
            
        }
        .frame(width: width, height: 218)
        .background(Color.cardCellBackground)
        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
        
    }
    
}

struct TopFoodPlacesView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        TopFoodPlacesView(items: topFoodPlacesItems)
//        FoodView(item: FoodPlace(title: "Оттепель", placeType: .restaurant, imageName: "imageRestaurantOttepel", rating: 4.7, reviewsCount: 1776, action: { }))
            .previewLayout(.fixed(width: 400, height: 300))
        
    }
    
}
