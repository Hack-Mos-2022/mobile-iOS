
import SwiftUI
//import MapKit

public struct Spinner: UIViewRepresentable {
    
    let style: UIActivityIndicatorView.Style
    
    public init(style: UIActivityIndicatorView.Style) {
        self.style = style
    }

    public func makeUIView(context: Context) -> UIActivityIndicatorView {
        let spinner = UIActivityIndicatorView(style: style)
        spinner.hidesWhenStopped = true
        spinner.startAnimating()
        spinner.color = .white40
        return spinner
    }
    
    public func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {}
}
