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

    let title = NSLocalizedString("Villagers", comment: "")
    private(set) lazy var snapshots = snapshotSubject.eraseToAnyPublisher()

    private let actions: VillagersActions

    private var subscriptions = Set<AnyCancellable>()
    private let snapshotSubject: CurrentValueSubject<Snapshot, Never>


    init(actions: VillagersActions = VillagersService()) {
        self.actions = actions

        var initialSnapshot = Snapshot()
        initialSnapshot.appendSections([.villagers])
        initialSnapshot.appendItems([Villager.stu, Villager.marshall])

        snapshotSubject = CurrentValueSubject<Snapshot, Never>(initialSnapshot)
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
                let snapshot = self.snapshot(for: villagers)
                self.snapshotSubject.send(snapshot)
            }
            .store(in: &subscriptions)
    }

    private func snapshot(for villagers: [Villager]) -> Snapshot {
        var snapshot = Snapshot()
        snapshot.appendSections([.villagers])
        snapshot.appendItems(villagers)
        return snapshot
    }
}
