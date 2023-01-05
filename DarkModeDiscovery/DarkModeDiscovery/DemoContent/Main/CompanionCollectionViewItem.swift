//
//  CompanionCollectionViewItem.swift
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

class CompanionCollectionViewItem: NSCollectionViewItem {

    override var isSelected: Bool {
        didSet {
            super.isSelected = isSelected
            view.layer?.borderWidth = isSelected ? 5.0 : 0.0
            view.layer?.backgroundColor = isSelected ?
                NSColor.red.cgColor : NSColor.blue.cgColor
        }
    }

    var companion: Companion? {
        didSet {
            guard isViewLoaded else { return }

            updateCompanionView()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.wantsLayer = true
        self.view.layer?.backgroundColor = NSColor.blue.cgColor

        #if DEBUG
        print("\(type(of: self)).\(#function)")
        #endif

        updateCompanionView()
    }

    func updateCompanionView() {

        #if DEBUG
        print("\(type(of: self)).\(#function)")
        #endif

        guard let companion = self.companion else { return }

        textField?.stringValue = companion.name
    }
}
