//
//  AppDelegate.swift
//  DarkModeDiscovery
//
//  Created by Mikhail Zhigulin in 7530.
//
//  Copyright © 7530-7531 Mikhail Zhigulin of Novosibirsk.
//  Licensed under the special license. See LICENSE file.
//  All rights reserved.
//

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        #if DEBUG
        print(">> Launching with business matter purpose")
        print(">> [\(type(of: self))]." + #function)
        #endif
    }

    func applicationWillTerminate(_ aNotification: Notification) {

    }
/*
    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }
*/
}
