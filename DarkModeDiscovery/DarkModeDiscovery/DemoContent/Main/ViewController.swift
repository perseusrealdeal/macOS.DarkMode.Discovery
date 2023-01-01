//
//  ViewController.swift
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

class ViewController: NSViewController {

    @IBOutlet weak var splitView: NSSplitView!
    @IBOutlet weak var leftSplitWidthConstraint: NSLayoutConstraint!

    private lazy var members: [Companion] = {
        guard let fileURL = Bundle.main.url(forResource: "companions", withExtension: "json"),
            let data = try? Data(contentsOf: fileURL)
            else { return [] }

        return (try? JSONDecoder().decode([Companion].self, from: data)) ?? []
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        let width = leftSplitWidthConstraint.constant
        splitView.setPosition(width, ofDividerAt: 0)

        representedObject = members
    }

    override var representedObject: Any? {
        didSet {
            print(#function)
        }
    }
}
