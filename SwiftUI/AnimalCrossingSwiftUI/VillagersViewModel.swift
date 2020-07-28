// Copyright © 2020 ACartagena. All rights reserved.

import Foundation
import Combine

class VillagersViewModel: ObservableObject {
    @Published var villagers: [Villager] = [] {
        didSet {
            print(villagers)
        }
    }
    private var cancellables = Set<AnyCancellable>()
    private let service: VillagersService

    init(service: VillagersService = VillagersService()) {
        self.service = service
    }

    func fetchVillagers() {
        service.villagers().sink { (completion) in
            print(completion)
        } receiveValue: { [weak self] (villagers) in
            self?.villagers = villagers
        }.store(in: &cancellables)
    }
}
