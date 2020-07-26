//  Copyright © 2020 ACartagena. All rights reserved.

import Foundation

enum APIError: Error {
    case network(Error)
    case noData
    case decoding(Error)
}
