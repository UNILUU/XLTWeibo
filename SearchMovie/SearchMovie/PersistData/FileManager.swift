//
//  FileManager.swift
//  SearchMovie
//
//  Created by Xiaolu on 3/13/19.
//

import Foundation

public extension FileManager {
    static var documentDirectoryURL: URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
}
