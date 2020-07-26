//  Copyright © 2020 ACartagena. All rights reserved.

import Foundation

public class VillagersAPI: API {
    public func villagers(completion: @escaping (Result<VillagersResponse, APIError>) -> Void) {
        let urlString = "http://acnhapi.com/v1/villagers/"
        guard let url = URL(string: urlString) else { return completion(.failure(.invalidURL(urlString))) }

        get(url: url, completion: completion)
    }
}
