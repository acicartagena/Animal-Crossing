// Copyright © 2020 ACartagena. All rights reserved.

import Foundation
import UIKit // only for snapshot

class VillagersViewModel {
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Villager>

    enum Section {
        case villagers
    }

    var snapshot: Snapshot

    let title = NSLocalizedString("Villagers", comment: "")

    init() {
        snapshot = Snapshot()
        snapshot.appendSections([.villagers])
        snapshot.appendItems([Villager.stu, Villager.marshall])
    }

    func start() {

    }
}
