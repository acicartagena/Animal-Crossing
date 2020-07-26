// Copyright © 2020 ACartagena. All rights reserved.

import Foundation
import UIKit // only for snapshot

protocol VillagersViewModelDelegate: AnyObject {
    func reload(snapshot: VillagersViewModel.Snapshot)
}

class VillagersViewModel {
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Villager>

    enum Section {
        case villagers
    }

    var snapshot: Snapshot
    weak var delegate: VillagersViewModelDelegate?

    let title = NSLocalizedString("Villagers", comment: "")
    private let actions: VillagersActions

    init(actions: VillagersActions = VillagersService()) {
        self.actions = actions
        snapshot = Snapshot()
        snapshot.appendSections([.villagers])
        snapshot.appendItems([Villager.stu, Villager.marshall])
    }

    func start() {
        // todo: add loading
        actions.villagers { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let villagers):
                print(villagers)
                var snapshot = Snapshot()
                snapshot.appendSections([.villagers])
                snapshot.appendItems(villagers)
                self.delegate?.reload(snapshot: snapshot)
            case .failure(let error):
                // todo: add error display
                print("error: \(error.localizedDescription)")
            }
        }
    }
}
