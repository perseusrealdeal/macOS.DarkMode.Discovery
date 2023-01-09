//
//  TopMainView.swift
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

class TopMainView: NSView {

    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)

        configure()

        #if DEBUG
        print("\(type(of: self)).\(#function)")
        #endif
    }

    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)

        configure()

        #if DEBUG
        print("\(type(of: self)).\(#function)")
        #endif
    }

    private func configure() {
        self.wantsLayer = true
        self.layer?.backgroundColor = NSColor.blue.cgColor
    }
}
