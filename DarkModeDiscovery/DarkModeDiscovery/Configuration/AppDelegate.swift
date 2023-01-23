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
        if let screen = NSScreen.main, var frame = NSApplication.shared.mainWindow?.frame {

            let height: CGFloat = 480 // Default main window height
            let width: CGFloat = 500 // Default main window width

            let origin_x = screen.frame.size.width / 2 - height / 2
            let origin_y = screen.frame.size.height / 2 - width / 2

            frame.size = NSSize(width: width, height: height)
            frame.origin = NSPoint(x: origin_x, y: origin_y)

            NSApplication.shared.mainWindow?.setFrame(frame, display: true)
        }
    }
}
