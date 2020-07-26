//  Copyright © 2020 ACartagena. All rights reserved.

import Foundation

public class VillagersAPI: API {

    public override init() {
        super.init()
    }

    public func villagers(completion: @escaping (Result<VillagersResponse, APIError>) -> Void) {
        let urlString = "https://acnhapi.com/v1/villagers/"
        guard let url = URL(string: urlString) else { return completion(.failure(.invalidURL(urlString))) }

        get(url: url, completion: completion)
    }
}
