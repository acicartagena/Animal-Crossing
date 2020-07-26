//  Copyright © 2020 ACartagena. All rights reserved.

import Foundation

enum HTTPMethod: String {
    case get
    case post
}

public class API {
    private let networking = Networking()

    private lazy var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()

    public func post<T: Decodable>(url: URL, body: Data? = nil, completion: @escaping (Result<T, APIError>) -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.post.rawValue
        request.httpBody = body
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        networking.request(request: request) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(data):
                do {
                    let decoded = try self.decoder.decode(T.self, from: data)
                    completion(.success(decoded))
                } catch {
                    completion(.failure(.decoding(error)))
                    return
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }

    public func get<T: Decodable>(url: URL, body: Data? = nil, completion: @escaping (Result<T, APIError>) -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.get.rawValue
        request.httpBody = body
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        networking.request(request: request) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(data):
                do {
                    let decoded = try self.decoder.decode(T.self, from: data)
                    completion(.success(decoded))
                } catch {
                    completion(.failure(.decoding(error)))
                    return
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
