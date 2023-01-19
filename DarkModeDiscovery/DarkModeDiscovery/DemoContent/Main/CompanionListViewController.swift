//
//  CompanionListViewController.swift
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

class CompanionListViewController: NSViewController {

    @IBOutlet weak var collectionView: NSCollectionView!

    var companionListSelectionHandler: ((Companion?) -> Void)?

    var companionList = [Companion]() {
        didSet {
            guard isViewLoaded else { return }

            reloadCompanionListAndSelectFirstItemIfNecessary()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView.wantsLayer = true
        // self.collectionView.layer?.backgroundColor = NSColor.blue.cgColor
        // self.collectionView.backgroundColors = [NSColor.blue]
        self.collectionView.backgroundColors = [NSColor.clear]
        self.view.wantsLayer = true
        // self.view.layer?.backgroundColor = NSColor.blue.cgColor

        reloadCompanionListAndSelectFirstItemIfNecessary()
    }

    private func reloadCompanionListAndSelectFirstItemIfNecessary() {

        if companionList.isEmpty {
            #if DEBUG && false
            print("\(type(of: self)).\(#function), it's empty!")
            #endif

            return
        }

        collectionView.reloadData()
    }
}

extension CompanionListViewController: NSCollectionViewDataSource {

    func collectionView(_ collectionView: NSCollectionView,
                        numberOfItemsInSection section: Int) -> Int {

        return companionList.count
    }

    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt
        indexPath: IndexPath) -> NSCollectionViewItem {

        let item = collectionView.makeItem(withIdentifier:
            NSUserInterfaceItemIdentifier(rawValue: "CompanionCollectionViewItem"),
            for: indexPath)

        if let companion = item as? CompanionCollectionViewItem {

            let one = companionList[(indexPath as NSIndexPath).item]
            companion.companion = one
        }

        return item
    }
}

extension CompanionListViewController: NSCollectionViewDelegate {
    func collectionView(_ collectionView: NSCollectionView,
                        didSelectItemsAt indexPaths: Set<IndexPath>) {
        handleSelectionChanged()
    }

    func collectionView(_ collectionView: NSCollectionView,
                        didDeselectItemsAt indexPaths: Set<IndexPath>) {
        handleSelectionChanged()
    }

    private func handleSelectionChanged() {
        guard let companionListSelectionHandler = companionListSelectionHandler else { return }

        let selectedCompanion: Companion?

        if let selectedIndexPath = collectionView.selectionIndexPaths.first,
            !companionList.isEmpty, (selectedIndexPath as NSIndexPath).item != -1 {
            selectedCompanion = companionList[(selectedIndexPath as NSIndexPath).item]
        } else {
            selectedCompanion = nil
        }

        companionListSelectionHandler(selectedCompanion)
    }
}
