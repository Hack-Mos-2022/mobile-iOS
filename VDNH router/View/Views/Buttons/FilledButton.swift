
import SwiftUI
//import NetUtils
//import NetModels

public typealias VoidCompletion = () -> Void

public struct FilledButton: View, Identifiable {
    
    public var id = UUID()
    
    private let title: String
    private let titleColor: Color
    private let isActiveState: Bool
    private let isLoading: Bool
    private let backgroundColor: Color
    private let action: VoidCompletion
    
    public init(
        title: String,
        titleColor: Color = .white100,
        isActiveState: Bool = true,
        isLoading: Bool = false,
        backgroundColor: Color = .mainRed,
        action: @escaping VoidCompletion = { }
    ) {
        self.title = title
        self.titleColor = titleColor
        self.isActiveState = isActiveState
        self.isLoading = isLoading
        self.backgroundColor = backgroundColor
        self.action = action
    }
    
    public var body: some View {
        
        HStack(spacing: 8) {
            
            Spacer()
            
            if isLoading {
                
                Spinner(style: .medium)
                    .foregroundColor(.white40)
                
            }
            
            Text(isLoading ? title + "..." : title)
                .padding(.vertical, 16)
                .foregroundColor(isActiveState && !isLoading ? titleColor : .white40)
                .font(.buttonDefault)
            
            Spacer()
            
        }
        .background(isActiveState && !isLoading ? backgroundColor : .clear)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(isActiveState && !isLoading ? Color.clear : .black50, lineWidth: 2)
        )
        .cornerRadius(12)
        .onTapGesture {
            guard isActiveState && !isLoading else { return }
            action()
        }
        
    }
    
}

struct FilledButton_Previews: PreviewProvider {
    
    static var previews: some View {
        
        FilledButton(title: "Продолжить", isActiveState: false, isLoading: false)
            .previewLayout(.fixed(width: 350.0, height: 100.0))
            .padding()
            .background(Color.mainBaground.ignoresSafeArea(.all))
    }
    
}
