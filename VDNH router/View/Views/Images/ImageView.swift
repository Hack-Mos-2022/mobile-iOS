
import SwiftUI

public struct ImageView: View {
    
    // MARK: - Private properties
    
    private let name: String
    private let size: Size?
    private let width: CGFloat?
    private let height: CGFloat?
    private let renderingMode: Image.TemplateRenderingMode
    private let color: Color
    private let aspectRatio: ContentMode
    private let bundleLocation: BundleLocation
    
    private var widthSize: CGFloat { width ?? size?.rawValue.width ?? 24}
    private var heightSize: CGFloat { height ?? size?.rawValue.height ?? 24}
    
    // MARK: - Public properties
    
    public enum BundleLocation {
        case module
        case external
    }
    
    public enum Size  {
        
        case sm
        case md
        case lg
        case xl
        case xxl
        case xxxl
		case huge
        
        var rawValue: CGSize {
            switch self {
            case .sm:
                return CGSize(width: 10, height: 10)
            case .md:
                return CGSize(width: 12, height: 12)
            case .lg:
                return CGSize(width: 14, height: 14)
            case .xl:
                return CGSize(width: 22, height: 22)
            case .xxl:
                return CGSize(width: 24, height: 24)
            case .xxxl:
                return CGSize(width: 48, height: 48)
			case .huge:
				return CGSize(width: 70, height: 70)
            }
        }
        
    }
    
    // MARK: - Lifecycle
    
    public init(
        name: String,
        size: ImageView.Size = .xl,
        width: CGFloat? = nil,
        height: CGFloat? = nil,
        renderingMode: Image.TemplateRenderingMode = .template,
        color: Color = .mainRed,
        aspectRatio: ContentMode = .fit,
        bundleLocation: BundleLocation = .module
    ) {
        self.name = name
        self.size = size
        self.width = width
        self.height = height
        self.renderingMode = renderingMode
        self.color = color
        self.aspectRatio = aspectRatio
        self.bundleLocation = bundleLocation
    }
    
    public var body: some View {
        
        Image(name, bundle: .main)
            .resizable()
            .renderingMode(renderingMode)
            .foregroundColor(color)
            .aspectRatio(contentMode: aspectRatio)
            .frame(width: widthSize, height: heightSize)
        
    }
    
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(name: "iconMapSettingsWorkloadActive", size: .xxl, renderingMode: .original)
            .previewLayout(.fixed(width: 350.0, height: 100.0))
            .padding()
            .background(Color.mainBaground.ignoresSafeArea(.all))
        
    }
}
