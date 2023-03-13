//
//  FileManaferService.swift
//  Navigation
//
//  Created by Евгений Стафеев on 13.03.2023.
//

import UIKit

class FileManagerService: FileManagerServiceProtocol {
    
    
    func contentsOfDirectory(currentDirectory: URL) -> [URL] {
        var contents: [URL] = []
        do {
            let files = try FileManager.default.contentsOfDirectory(at: currentDirectory, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
            contents = files
            
        } catch {
            print("ERROR contentsOfDirectory")
        }
        return contents
    }
    
    
    func createDirectory(currentDirectory: URL, newDirectoryName: String) {
        let newDirectoryURL = currentDirectory.appendingPathComponent(newDirectoryName)
        do {
            try FileManager.default.createDirectory(atPath: newDirectoryURL.path, withIntermediateDirectories: false)
        } catch {
            print("createDirectory error: \(error.localizedDescription)")
        }
    }
    
    func createFile(currentDirectory: URL, newFile: URL) {
        let fileURL = currentDirectory.appendingPathComponent(newFile.lastPathComponent)
        do {
            FileManager.default.createFile(atPath: fileURL.path, contents: Data())
        }
    }
    
    func removeContent(currentDirectory: URL, toDelete: URL) {
        do {
            try FileManager.default.removeItem(at: toDelete)
        } catch {
            print("removeContent error: \(error.localizedDescription)")
        }
    }
}
