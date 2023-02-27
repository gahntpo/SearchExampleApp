
import SwiftUI

extension Image {
    init(stringURL: String) {
        let name = String(stringURL.split(separator: ".")[0])
        let ext = String(stringURL.split(separator: ".")[1])
        var uiImage = UIImage()
        
        do {
            if let filePath = Bundle.main.url(forResource: name, withExtension: ext) {
                let imageData = try Data(contentsOf: filePath)
                uiImage = UIImage(data: imageData)!
            } else {
            }
        } catch let error {
            print("[System] Error while bring local image: \(error)")
            self.init(systemName: "xmark")
        }
        self.init(uiImage: uiImage)
    }
}


