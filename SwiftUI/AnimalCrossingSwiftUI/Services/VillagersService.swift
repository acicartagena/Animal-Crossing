// Copyright © 2020 ACartagena. All rights reserved.

import Foundation
import AnimalCrossingAPI
import Combine

final class VillagersService {

    private let api: AnimalCrossingAPI
    init(api: AnimalCrossingAPI = AnimalCrossingAPI()) {
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
