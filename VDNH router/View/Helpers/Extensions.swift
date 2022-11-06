//
//  Extensions.swift
//  VDNH router
//
//  Created by Anatoliy Podkladov on 30.10.2022.
//

import SwiftUI

extension View {
    
    @ViewBuilder
    func bottomSheet<Content: View>(
        presentationDetents: Set<PresentationDetent>,
        isPresented: Binding<Bool>,
        dragIndicator: Visibility = .visible,
        cornerRadius: CGFloat?,
        largestUndimmendIdentifier: UISheetPresentationController.Detent.Identifier = .large,
        isTransparentBackground: Bool = false,
        interactiveDisabled: Bool = true,
        @ViewBuilder content: @escaping () -> Content,
        onDismiss: @escaping () -> ()
    ) -> some View {
        self
            .sheet(isPresented: isPresented) {
                onDismiss()
            } content: {
                content()
                    .presentationDetents(presentationDetents)
                    .presentationDragIndicator(dragIndicator)
                    .interactiveDismissDisabled(interactiveDisabled)
                    .onAppear {
                        guard let window = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
                        
                        if let controller = window.windows.first?.rootViewController?.presentedViewController,
                           let sheet = controller.presentationController as? UISheetPresentationController {
                            
                            if isTransparentBackground {
                                controller.view.backgroundColor = .clear
                            }
                            
                            controller.presentingViewController?.view.tintAdjustmentMode = .normal
                            
                            sheet.largestUndimmedDetentIdentifier = largestUndimmendIdentifier
                            sheet.preferredCornerRadius = cornerRadius
                        } else {
                            assertionFailure("No controller found!!!")
                        }
                        
                    }
            }
    }
    
}

