//
//  WeekendEvents.swift
//  VDNH router
//
//  Created by Anatoliy Podkladov on 04.11.2022.
//

import SwiftUI

let weekendEventsItems: [YoullLikedIt] = [
    YoullLikedIt(title: "Выставки, которые\nстоит посетить", type: .online, imageName: "imageExhibitions", placeCount: 15, placeCountText: "выставок", action: { }),
    YoullLikedIt(title: "Новые\nэкскурсии", type: .online, imageName: "imageNewExcursions", action: { }),
    YoullLikedIt(title: "Все советы", allCount: 22, imageName: "", action: { }),
]

struct WeekendEvents: View {
    
    let items: [YoullLikedIt]
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 11) {
            
            if let item = items.first {
                
                YoullLikedItView(item: item, height: 281)
                
            }
            
            HStack(spacing: 11) {
                
                if let item = secondItem {
                    
                    YoullLikedItView(item: item, width: bottomCellsWidth, height: 183)
                    
                }
                
                if let item = items.last {
                    
                    YoullLikedItView(item: item, width: bottomCellsWidth, height: 183)
                }
                
            }
            
        }
        
    }
    
    private var screenWidth: CGFloat { UIScreen.main.bounds.size.width }
    private var bottomCellsWidth: CGFloat { (screenWidth - 48 - 11) / 2 }
    
    private var secondItem: YoullLikedIt? {
        items.count > 2 ? items[1] : nil
    }
}

struct WeekendEvents_Previews: PreviewProvider {
    
    static var previews: some View {
        
        WeekendEvents(
            items: weekendEventsItems
        )
        
    }
    
}
