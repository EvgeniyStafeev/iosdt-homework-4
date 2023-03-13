//
//  FileServiceProtocol.swift
//  Navigation
//
//  Created by Евгений Стафеев on 13.03.2023.
//

import UIKit

 protocol FileManagerServiceProtocol {
     func contentsOfDirectory(currentDirectory: URL) -> [URL]
     func createDirectory(currentDirectory: URL, newDirectoryName: String)
     func createFile(currentDirectory: URL, newFile: URL)
     func removeContent(currentDirectory: URL, toDelete: URL)
 }
