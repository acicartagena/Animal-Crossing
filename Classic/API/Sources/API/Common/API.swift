//  Copyright © 2020 ACartagena. All rights reserved.

import Foundation
import Combine

enum HTTPMethod: String {
    case get
}

public class API {
    @available(iOS 13.0, *)
    func get<T: Decodable>(url: URL) -> AnyPublisher<T, APIError> {
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.get.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        return URLSession.shared.dataTaskPublisher(for: request)
            .receive(on: DispatchQueue.main)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { (error) -> APIError in
                switch error {
                case is Swift.DecodingError:
                    return APIError.decoding(error)
                default:
                    return APIError.network(error)
                }
            }
            .eraseToAnyPublisher()
    }
}
