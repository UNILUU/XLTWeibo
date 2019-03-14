//
//  Image.swift
//  SearchMovie
//
//  Created by  on 3/13/19.
//

import Foundation
import UIKit

extension UIImage {
    
    static func getPNGFromDocumentDirectory(name: String) -> UIImage? {
        return UIImage(contentsOfFile:FileManager.documentDirectoryURL.appendingPathComponent(name).appendingPathExtension("jpg").path
        )
    }
    
    func save(directory: FileManager.SearchPathDirectory, name: String) throws {
        let kindDirectoryURL = URL( fileURLWithPath: "", relativeTo: FileManager.default.urls(for: directory, in: .userDomainMask)[0])
        
        try? FileManager.default.createDirectory(at: kindDirectoryURL, withIntermediateDirectories: true)
        
        try self.jpegData(compressionQuality:0.7)?.write(to: kindDirectoryURL.appendingPathComponent(name).appendingPathExtension("jpg"),options: .atomic)
    }
}
