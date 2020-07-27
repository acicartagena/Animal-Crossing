//  Copyright © 2020 ACartagena. All rights reserved.

import Foundation

public enum APIError: Error, LocalizedError {
    case network(Error)
    case decoding(Error)
    case invalidURL(String)

    public var errorDescription: String? {
        switch self {
        case let .network(error): return "Network: \(error.localizedDescription)"
        case let .decoding(error): return "Decoding: \(error.localizedDescription)"
        case let .invalidURL(url): return "Invalid URL: \(url)"
        }
    }
}
