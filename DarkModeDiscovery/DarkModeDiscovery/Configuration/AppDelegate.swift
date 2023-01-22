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

class AppDelegate: NSObject, NSApplicationDelegate {

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        #if DEBUG && true
        print(">> Launching with business matter purpose")
        print(">> [\(type(of: self))]." + #function)
        #endif

        AppearanceService.recalculateStyleIfNeeded()

        // MARK: - Issue: IB Window Minimum Content Size doesn't apply correctly.
        // macOS High Sierra (10.13.6), Xcode 10.1
        if var frame = NSApplication.shared.mainWindow?.frame {
            frame.size = NSSize(width: 480, height: 500)
            NSApplication.shared.mainWindow?.setFrame(frame, display: true)
        }
    }
}
