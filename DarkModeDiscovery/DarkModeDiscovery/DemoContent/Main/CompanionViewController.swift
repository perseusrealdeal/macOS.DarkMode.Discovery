//
//  CompanionViewController.swift
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

class CompanionViewController: NSViewController {

    @IBOutlet weak var nameValue: NSTextField!

    @IBOutlet weak var ageLabel: NSTextField!
    @IBOutlet weak var ageValue: NSTextField!

    @IBOutlet weak var raceLabel: NSTextField!
    @IBOutlet weak var raceValue: NSTextField!

    @IBOutlet var bioTextView: NSTextView!

    let darkModeObserver = DarkModeObserver()

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

        bioTextView.backgroundColor = NSColor.clear

        darkModeObserver.action = { newStyle in self.setDarkModeSensitiveColours() }

        setDarkModeSensitiveColours()
        updateCompanionView(nil)
    }

    func updateCompanionView(_ companion: Companion?) {
        guard let friend = companion else {
            nameValue.stringValue = ""
            ageValue.stringValue = ""
            raceValue.stringValue = ""
            bioTextView.string = ""

            ageLabel.isHidden = true
            raceLabel.isHidden = true

            return
        }

        ageLabel.isHidden = false
        raceLabel.isHidden = false

        nameValue.stringValue = friend.name
        ageValue.stringValue = friend.age
        raceValue.stringValue = friend.race.single

        bioTextView.string = friend.characteristics
    }

    private func setDarkModeSensitiveColours() {
        self.bioTextView.textColor = .white

        self.nameValue.textColor = .perseusGray6
        self.ageValue.textColor = .perseusGray6
        self.raceValue.textColor = .perseusGray6

        self.ageLabel.textColor = .perseusGray6
        self.raceLabel.textColor = .perseusGray6
    }
}
