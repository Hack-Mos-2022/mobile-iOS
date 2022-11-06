//
//  EventTypeView.swift
//  VDNH router
//
//  Created by Anatoliy Podkladov on 04.11.2022.
//

import SwiftUI

struct EventTypeView: View {
    
    let item: EventType
    
    var body: some View {
        
            Button(action: item.action) {
                
                VStack(spacing: 0) {
                    
                    ImageView(name: item.iconName, size: .xxl, renderingMode: .original)
                        .padding(.top, 18)
                    
                    Spacer()
                    
                    Text(item.title)
                        .padding([.bottom], 14)
                        .font(.captionSmallTextSemiBold)
                        .minimumScaleFactor(0.7)
                        .lineLimit(2)
                        .foregroundColor(.white60)
                        .frame(width: 80)
                    
                }
                .background(Color.black50)
                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                
            }
            .frame(width: 80, height: 90)
            
    }
    
}

struct EventTypeView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        EventTypeView(item: EventType(iconName: "iconEventTypeFerrisWheel", title: "Колесо\nобозрения", action: { }))
        
    }
    
}
