//  Copyright © 2020 ACartagena. All rights reserved.

import Foundation

public enum APIError: Error {
    case network(Error)
    case noData
    case decoding(Error)
    case invalidURL(String)
}
