//
//  EventCellWithHeader.swift
//  VDNH router
//
//  Created by Anatoliy Podkladov on 04.11.2022.
//

import SwiftUI

struct EvenCellWithHeader<Content: View>: View {
    
    let headerTitle: String
    let rightButtonName: String?
    let rightButtonAction: VoidCompletion
    let content: Content
    
    public init(
        headerTitle: String,
        rightButtonName: String? = nil,
        rightButtonAction: @escaping VoidCompletion,
        @ViewBuilder content: () -> Content
    ) {
        self.headerTitle = headerTitle
        self.rightButtonName = rightButtonName
        self.rightButtonAction = rightButtonAction
        self.content = content()
    }
    
    var body: some View {
        
        VStack(spacing: 24) {
            
            getHeaderView(title: headerTitle, rightButtonName: rightButtonName, action: rightButtonAction)
                .padding(.top, 20)
                .padding(.horizontal, 24)
            
            content
//                .padding(.leading, 24)
            
        }
        
    }
    
    // MARK: Private methods
    
    private func getHeaderView(title: String, rightButtonName: String?, action: @escaping VoidCompletion) -> some View {
        
        HStack() {
            
            Text(title)
                .font(.textLarge)
                .foregroundColor(.white100)
            
            Spacer()
            
            if let rightButtonName = rightButtonName {
                
                Button(action: action) {
                    Text(rightButtonName)
                        .font(.captionTextSemiBold)
                        .foregroundColor(.black30)
                }
                
            }
            
        }
        
    }
    
}
