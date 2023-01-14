//
//  CompanionViewController.swift
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

class CompanionViewController: NSViewController {

    @IBOutlet weak var label: NSTextField!

    var companion: Companion? {
        didSet {
            guard isViewLoaded else { return }

            updateCompanionView(companion)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.wantsLayer = true
        self.view.layer?.backgroundColor = NSColor.blue.cgColor

        #if DEBUG && useConsole
        print("\(type(of: self)).\(#function)")
        #endif
    }

    func updateCompanionView(_ companion: Companion?) {
        print(#function)
        label.stringValue = companion?.name ?? ""
    }
}
