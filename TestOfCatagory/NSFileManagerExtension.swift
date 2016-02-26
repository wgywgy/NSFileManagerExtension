//
//  NSFileManagerExtension.swift
//  TestOfCatagory
//
//  Created by wuguanyu on 16/2/24.
//  Copyright © 2016年 dejauu. All rights reserved.
//

import Foundation

extension NSFileManager {

    private class func URLForDirectory(directory: NSSearchPathDirectory) -> NSURL? {
        return defaultManager().URLsForDirectory(directory, inDomains: .UserDomainMask).last
    }

    private class func pathForDirectory(directory: NSSearchPathDirectory) -> String? {
        return NSSearchPathForDirectoriesInDomains(directory, .UserDomainMask, true)[0]
    }

    class func documentsURL() -> NSURL {
        return URLForDirectory(.DocumentDirectory)!
    }

    class func documentsPath() -> String {
        return pathForDirectory(.DocumentDirectory)!
    }

    class func libraryURL() -> NSURL {
        return URLForDirectory(.LibraryDirectory)!
    }

    class func libraryPath() -> String {
        return pathForDirectory(.LibraryDirectory)!
    }

    class func cachesURL() -> NSURL {
        return URLForDirectory(.CachesDirectory)!
    }

    class func cachesPath() -> String {
        return pathForDirectory(.CachesDirectory)!
    }

    class func addSkipBackupAttributeToFile(filePath: String) {
        if let url: NSURL = NSURL(fileURLWithPath: filePath) {
            do {
                try url.setResourceValue(NSNumber(bool: true), forKey: NSURLIsExcludedFromBackupKey)
            } catch {
            }
        }
    }

    class func availableDiskSpaceMb() -> Double {
        let fileAttributes = try? defaultManager().attributesOfFileSystemForPath(documentsPath())
        if let fileSize = fileAttributes![NSFileSystemSize]?.doubleValue {
            return fileSize / Double(0x100000)
        }

        return 0
    }

}
