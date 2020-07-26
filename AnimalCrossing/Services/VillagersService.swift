// Copyright © 2020 ACartagena. All rights reserved.

import Foundation
import API
import Combine

protocol VillagersActions {
    func villagers() -> AnyPublisher<[Villager], AnimalCrossingError>
}

final class VillagersService: VillagersActions {

    private let api: VillagersAPI
    init(api: VillagersAPI = VillagersAPI()) {
        self.api = api
    }

    func villagers() -> AnyPublisher<[Villager], AnimalCrossingError> {
        return api.villagers()
            .map { (response) -> [Villager] in
                return response.values.map { Villager(response: $0) }
            }
            .mapError { return AnimalCrossingError.api($0) }
            .eraseToAnyPublisher()
    }
}
