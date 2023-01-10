//
//  PreferencesVC.swift
//  DarkModeDiscovery
//
//  Created by Mikhail Zhigulin in 7531.
//
//  Copyright © 7531 Mikhail Zhigulin of Novosibirsk.
//
//  Licensed under the special license. See LICENSE file.
//  All rights reserved.
//

import Cocoa

class PreferencesViewController: NSViewController {

    @IBOutlet weak var segmentedControl: NSSegmentedControl!

    @IBAction func segmentedControlValueChanged(_ sender: NSSegmentedCell) {
        changeDarkModeValue(selected: sender.selectedSegment)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.preferredContentSize = NSSize(width: self.view.frame.size.width,
                                           height: self.view.frame.size.height)
    }

    override func viewDidAppear() {
        super.viewDidAppear()

        self.view.wantsLayer = true
        self.view.layer?.backgroundColor = NSColor.blue.cgColor

        self.parent?.view.window?.title = self.title!
        updateDarkModeOption()
    }

    private func updateDarkModeOption() {
        switch AppearanceService.DarkModeUserChoice {
        case .auto:
            segmentedControl.selectedSegment = 2
        case .on:
            segmentedControl.selectedSegment = 1
        case .off:
            segmentedControl.selectedSegment = 0
        }
    }

    private func changeDarkModeValue(selected: Int) {
        switch selected {
        case 0:
            changeDarkModeManually(.off)
        case 1:
            changeDarkModeManually(.on)
        case 2:
            changeDarkModeManually(.auto)
        default:
            break
        }
    }
}
