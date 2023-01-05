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

    var companionListViewController: CompanionListViewController?
    var companionViewController: CompanionViewController? {
        didSet {
            companionListViewController?.companionListSelectionHandler = { companion in
                self.companionViewController?.companion = companion
            }
            companionListViewController?.companionList = companions
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

        #if DEBUG
        print("\(type(of: self)).\(#function)")
        #endif
    }

    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {

        #if DEBUG
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
