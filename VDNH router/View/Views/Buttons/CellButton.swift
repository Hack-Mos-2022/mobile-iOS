
import SwiftUI

public struct CellButton: View {
    
    var iconName: String? = nil
    var iconActiveColor: Color
    var iconInactiveColor: Color
    var title: String
    var subtitle: String?
    var backgroundActiveColor: Color
    var backgroundInactiveColor: Color
    var isActiveRightArrowIcon: Bool
    var isActiveState: Bool = true
    var isLoading: Bool
    var action: VoidCompletion
    
    public init(
        iconName: String? = nil,
        iconActiveColor: Color = .mainRed,
        iconInactiveColor: Color = .white50,
        title: String,
        subtitle: String? = nil,
        backgroundActiveColor: Color = .clear,
        backgroundInactiveColor: Color = .clear,
        isActiveRightArrowIcon: Bool = true,
        isActiveState: Bool = true,
        isLoading: Bool = false,
        action: @escaping VoidCompletion
    ) {
        self.iconName = iconName
        self.iconActiveColor = iconActiveColor
        self.iconInactiveColor = iconInactiveColor
        self.title = title
        self.subtitle = subtitle
        self.backgroundActiveColor = backgroundActiveColor
        self.backgroundInactiveColor = backgroundInactiveColor
        self.isActiveRightArrowIcon = isActiveRightArrowIcon
        self.isActiveState = isActiveState
        self.isLoading = isLoading
        self.action = action
    }
    
    public var body: some View {
        
        Button(action: action) {
            
            HStack(alignment: .center, spacing: 0) {
                
                if let iconName = iconName {
                    
                    ImageView(
                        name: iconName,
                        size: .xl,
                        color: isActiveState && !isLoading ? iconActiveColor : iconInactiveColor
                    )
                    .padding(.trailing, 14)
                    
                }
                
                Text(title)
                    .font(.captionTextSemiBold)
                    .foregroundColor(isActiveState && !isLoading ? .white100 : .white50)
                    .scaledToFill()
                    .minimumScaleFactor(0.5)
                    .lineLimit(1)
                    .fixedSize(horizontal: false, vertical: true)
                
                Spacer()
                
                if let subtitle = subtitle {
                    
                    Text(subtitle)
                        .font(.captionTextSemiBold)
                        .foregroundColor(.white50)
                        .padding(.vertical, 2)
                        .padding(.horizontal, 6)
                        .background(Color.yellow)
                        .cornerRadius(30)
                        .padding(.trailing, 10)
                    
                }
                
//                if isActiveState && !isLoading && isActiveRightArrowIcon {
//
////                    ImageView(name: "iconRightArrow", size: .md, color: .primaryColor)
//
//                } else
                if isLoading {
                    
                    Spinner(style: .medium)
                        .foregroundColor(.white50)
                    
                }
                
            }
//            .padding(.horizontal)
            .frame(height: 42, alignment: .center)
            .frame(maxWidth: .infinity)
            .background(isActiveState && !isLoading ? backgroundActiveColor : backgroundInactiveColor)
            .cornerRadius(5)
            
            
        }
        .disabled(!isActiveState || isLoading)
        
    }
}

struct ArrowButton_Previews: PreviewProvider {
    
    static var previews: some View {
//        CellButton(
//            title: "По номеру телефона",
//            subtitle: "Без комиссии",
//            isLoading: true,
//            action: {}
//        )
        CellButton(
            iconName: "iconMapSettingsWorkloadActive",
            title: "По номеру телефона",
            isActiveState: true,
            isLoading: false,
            action: {}
        )
            .padding()
        
        .background(Color.mainBaground.ignoresSafeArea(.all))
    }
    
}
