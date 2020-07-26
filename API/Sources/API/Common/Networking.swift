//  Copyright © 2020 ACartagena. All rights reserved.

import Foundation

class Networking {
    let session = URLSession(configuration: .default)

    func request(request: URLRequest, completion: @escaping (Result<Data, APIError>) -> Void) {
        session.dataTask(with: request) { data, _, error in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(.network(error)))
                    return
                }

                guard let data = data else {
                    completion(.failure(.noData))
                    return
                }

                completion(.success(data))
            }
        }
        .resume()
    }
}
