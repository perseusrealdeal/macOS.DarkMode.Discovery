//
//  MainWindow.swift
//  DarkModeDiscovery
//
//  Created by Mikhail Zhigulin in 7530.
//
//  Copyright © 7530 - 7531 Mikhail Zhigulin of Novosibirsk.
//
//  Licensed under the special license. See LICENSE file.
//  All rights reserved.
//

import Cocoa

class MainWindow: NSWindow {

    var preferencesController: NSWindowController?

    @IBAction func showPreferences(_ sender: Any) {
        if !(preferencesController != nil) {
            let storyboard = NSStoryboard(name: NSStoryboard.Name("Preferences"),
                                          bundle: nil)

            preferencesController = storyboard.instantiateInitialController()
                as? NSWindowController
        }

        if preferencesController != nil {
            preferencesController!.showWindow(sender)
        }
    }
}
