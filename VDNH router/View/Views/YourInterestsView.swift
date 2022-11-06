//
//  YourInterestsView.swift
//  VDNH router
//
//  Created by Anatoliy Podkladov on 04.11.2022.
//

import SwiftUI

let yourIterestsItems: [YourInterests] = [
    YourInterests(iconName: "iconBouling", title: "Семейный отдых", placeCount: 12, action: { }),
    YourInterests(iconName: "iconFootball", title: "Активный отдых", placeCount: 36, action: { }),
    YourInterests(iconName: "iconCombo", title: "Комбо-программы", placeCount: 5, action: { }),
]

struct YourInterestsView: View {
    
    let item: YourInterests
    
    var body: some View {
        
        Button(action: item.action) {
            
            VStack(alignment: .leading, spacing: 0) {
                
                ImageView(name: item.iconName, size: .xxxl, renderingMode: .original)
                    .padding(.top, 24)
                    .padding(.leading, 16)
                    .padding(.bottom, 13)
                
                HStack {
                    
                    VStack(alignment: .leading, spacing: 7) {
                        
                        Text("\(item.placeCount) мест")
                            .font(.captionTextSemiBold)
                            .foregroundColor(.white60)
                        
                        HStack {
                            
                            Text(item.title)
                                .lineLimit(2)
                                .font(.textBold)
                                .foregroundColor(.white100)
                                .fixedSize(horizontal: false, vertical: true)
                                .multilineTextAlignment(.leading)
                            
                            Spacer()
                            
                        }
                        
                    }
                    .padding(.bottom, 16)
                    
                }
                .padding(.horizontal, 20)
                
                Spacer()
                
            }
            .background(Color.black50)
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            .frame(width: 159, height: 166)
            
        }
        
    }
    
}

struct YourInterestsView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        YourInterestsView(item: YourInterests(iconName: "iconBouling", title: "Семейный отдых", placeCount: 12, action: { }))
        
    }
    
}
