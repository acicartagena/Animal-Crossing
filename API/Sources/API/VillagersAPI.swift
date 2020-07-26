//  Copyright © 2020 ACartagena. All rights reserved.

import Foundation
import Combine

public class VillagersAPI: API {

    public override init() {
        super.init()
    }

    @available(iOS 13.0, *)
    public func villagers() -> AnyPublisher<VillagersResponse, APIError> {
        let urlString = "https://acnhapi.com/v1/villagers/"
        guard let url = URL(string: urlString) else {
            return Fail(error: APIError.invalidURL(urlString))
                .eraseToAnyPublisher()
        }

        return get(url: url)
    }
}
