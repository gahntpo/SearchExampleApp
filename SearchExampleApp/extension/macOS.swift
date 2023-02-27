//


import SwiftUI

typealias UIImage = NSImage

extension Image {
    
    init(uiImage: UIImage) {
        self.init(nsImage: uiImage)
    }
}
