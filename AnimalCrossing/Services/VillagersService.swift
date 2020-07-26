// Copyright © 2020 ACartagena. All rights reserved.

import Foundation
import API

protocol VillagersActions {
    func villagers(completion: @escaping(Result<[Villager], AnimalCrossingError>) -> Void)
}

final class VillagersService: VillagersActions {

    private let api: VillagersAPI
    init(api: VillagersAPI = VillagersAPI()) {
        self.api = api
    }

    func villagers(completion: @escaping(Result<[Villager], AnimalCrossingError>) -> Void) {
        api.villagers { result in
            switch result {
            case .success(let response):
                let villagers = response.values.map { Villager(response: $0) }
                completion(.success(villagers))
            case .failure(let error):
                completion(.failure(.api(error)))
            }
        }
    }
}
