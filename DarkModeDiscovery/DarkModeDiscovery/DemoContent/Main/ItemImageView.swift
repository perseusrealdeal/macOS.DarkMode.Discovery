//
//  ItemImageView.swift
//  DarkModeDiscovery
//
//  Created by Mikhail Zhigulin on 12/01/2023.
//  Copyright © 2023 PerseusRealDeal. All rights reserved.
//

import Cocoa

class ItemImageView: NSImageView {

    override var image: NSImage? {
        set {
            super.image = newValue
            self.layer?.contents = newValue
        }

        get {
            return super.image
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()

        if let img = image {
            self.image = img
        }
    }

    private func configure() {
        self.wantsLayer = true

        self.layer = CALayer()
        self.layer?.contentsGravity = CALayerContentsGravity.resizeAspect

        self.layer?.cornerRadius = 25.0
        self.layer?.masksToBounds = true

        self.imageScaling = .scaleAxesIndependently
    }
}
