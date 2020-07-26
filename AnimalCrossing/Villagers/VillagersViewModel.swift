// Copyright © 2020 ACartagena. All rights reserved.

import Foundation
import UIKit // only for snapshot
import Combine

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

    private var subscribers = Set<AnyCancellable>()

    init(actions: VillagersActions = VillagersService()) {
        self.actions = actions
        snapshot = Snapshot()
        snapshot.appendSections([.villagers])
        snapshot.appendItems([Villager.stu, Villager.marshall])
    }

    func start() {
        // todo: add loading
        actions.villagers()
            .sink(receiveCompletion: { (completion) in
                switch completion {
                case .failure(let error):
                    // todo: add error display
                    print("error: \(error.localizedDescription)")
                case .finished: break
                }
            }) { (villagers) in
                var snapshot = Snapshot()
                snapshot.appendSections([.villagers])
                snapshot.appendItems(villagers)
                self.delegate?.reload(snapshot: snapshot)
            }
            .store(in: &subscribers)
    }
}
