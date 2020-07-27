// Copyright © 2020 ACartagena. All rights reserved.

import Foundation
import UIKit

extension UICollectionView {
    func register<T>(_ aClass: T.Type) where T: UICollectionViewCell {
        register(aClass, forCellWithReuseIdentifier: aClass.reuseIdentifier)
    }

    func dequeCell<T>(for indexPath: IndexPath) -> T where T: UICollectionViewCell {
        dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T ?? T()
    }
}
