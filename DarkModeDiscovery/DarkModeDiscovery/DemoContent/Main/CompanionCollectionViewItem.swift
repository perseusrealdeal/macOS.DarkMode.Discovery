//
//  CompanionCollectionViewItem.swift
//  DarkModeDiscovery
//
//  Created by Mikhail Zhigulin in 7531.
//
//  Copyright © 7531 Mikhail Zhigulin of Novosibirsk.
//  Copyright © 7531 PerseusRealDeal.
//
//  Licensed under the special license. See LICENSE file.
//  All rights reserved.
//

import Cocoa

class CompanionCollectionViewItem: NSCollectionViewItem {

    override var isSelected: Bool {
        didSet {
            super.isSelected = isSelected

            imageView?.layer?.borderWidth = isSelected ? 5.0 : 0.0
            imageView?.layer?.borderColor = NSColor.white.cgColor

            textField?.textColor = isSelected ? NSColor.white : NSColor.black
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

        updateCompanionView()
    }

    func updateCompanionView() {
        guard let friend = self.companion else { return }

        textField?.stringValue = friend.name
        imageView?.image = NSImage(named: friend.iconName)
    }
}
