//
//  AppDelegate.swift
//  DarkModeDiscovery
//
//  Created by Mikhail Zhigulin in 7530.
//
//  Copyright © 7530 - 7531 Mikhail Zhigulin of Novosibirsk.
//  Copyright © 7530 - 7531 PerseusRealDeal.
//
//  Licensed under the special license. See LICENSE file.
//  All rights reserved.
//

import Cocoa
let USE = true
class AppDelegate: NSObject, NSApplicationDelegate {

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        #if DEBUG && true
        print(">> Launching with business matter purpose")
        print(">> [\(type(of: self))]." + #function)
        #endif

        AppearanceService.recalculateStyleIfNeeded()
    }
}
