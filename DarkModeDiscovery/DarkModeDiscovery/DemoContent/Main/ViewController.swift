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

    @IBOutlet weak var topMainImageView: DarkModeImageView!
    @IBOutlet weak var bottomMainImageView: DarkModeImageView!

    var companionListViewController: CompanionListViewController? {
        didSet {
            companionListViewController?.companionList = companions
        }
    }

    var companionViewController: CompanionViewController? {
        didSet {
            companionListViewController?.companionListSelectionHandler = { companion in
                self.companionViewController?.companion = companion
            }
        }
    }

    lazy var companions: [Companion] = {
        guard let fileURL = Bundle.main.url(forResource: "companions", withExtension: "json"),
            let data = try? Data(contentsOf: fileURL)
            else { return [] }

        return (try? JSONDecoder().decode([Companion].self, from: data)) ?? []
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        let width = leftSplitWidthConstraint.constant
        splitView.setPosition(width, ofDividerAt: 0)

        #if DEBUG && false
        print("\(type(of: self)).\(#function)")
        #endif

        topMainImageView.imageDark = NSImage(named: "Dwarves")
        topMainImageView.imageLight = NSImage(named: "Erebor")

        bottomMainImageView.imageDark = NSImage()
        bottomMainImageView.imageLight = NSImage()
    }

    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {

        #if DEBUG && false
        print("\(type(of: self)).\(#function)")
        #endif

        switch segue.destinationController {

        case let companionListViewController as CompanionListViewController:
            self.companionListViewController = companionListViewController

        case let companionViewController as CompanionViewController:
            self.companionViewController = companionViewController

        default:
            break
        }
    }
}
