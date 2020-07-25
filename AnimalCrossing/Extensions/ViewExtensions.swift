// Copyright © 2020 ACartagena. All rights reserved.

import Foundation
import UIKit

extension UIView {
    func addSubviewsUsingAutoLayout(_ views: UIView ...) {
        for view in views {
            addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}

extension NSLayoutConstraint {
    func set(priority: UILayoutPriority, isActive: Bool) {
        self.priority = priority
        self.isActive = isActive
    }
}

@objc extension NSLayoutAnchor {
    @discardableResult
    func constraint(_ relation: NSLayoutConstraint.Relation = .equal,
                    to anchor: NSLayoutAnchor,
                    with constant: CGFloat = 0.0,
                    priority: UILayoutPriority = .required,
                    isActive: Bool = true) -> NSLayoutConstraint {
        let constraint: NSLayoutConstraint

        switch relation {
        case .equal:
            constraint = self.constraint(equalTo: anchor, constant: constant)
        case .greaterThanOrEqual:
            constraint = self.constraint(greaterThanOrEqualTo: anchor, constant: constant)
        case .lessThanOrEqual:
            constraint = self.constraint(lessThanOrEqualTo: anchor, constant: constant)
        @unknown default:
            fatalError()
        }

        constraint.set(priority: priority, isActive: isActive)
        return constraint
    }
}

@objc extension NSLayoutDimension {
    @discardableResult
    func constraint(_ relation: NSLayoutConstraint.Relation = .equal,
                    to anchor: NSLayoutDimension,
                    with constant: CGFloat = 0.0,
                    multiplyBy multiplier: CGFloat = 1.0,
                    priority: UILayoutPriority = .required,
                    isActive: Bool = true) -> NSLayoutConstraint {
        let constraint: NSLayoutConstraint

        switch relation {
        case .equal:
            constraint = self.constraint(equalTo: anchor, multiplier: multiplier, constant: constant)
        case .greaterThanOrEqual:
            constraint = self.constraint(greaterThanOrEqualTo: anchor, multiplier: multiplier, constant: constant)
        case .lessThanOrEqual:
            constraint = self.constraint(lessThanOrEqualTo: anchor, multiplier: multiplier, constant: constant)
        @unknown default:
            fatalError()
        }

        constraint.set(priority: priority, isActive: isActive)

        return constraint
    }

    @discardableResult
    func constraint(_ relation: NSLayoutConstraint.Relation = .equal,
                    with constant: CGFloat = 0.0,
                    priority: UILayoutPriority = .required,
                    isActive: Bool = true) -> NSLayoutConstraint {
        let constraint: NSLayoutConstraint

        switch relation {
        case .equal:
            constraint = self.constraint(equalToConstant: constant)
        case .greaterThanOrEqual:
            constraint = self.constraint(greaterThanOrEqualToConstant: constant)
        case .lessThanOrEqual:
            constraint = self.constraint(lessThanOrEqualToConstant: constant)
        @unknown default:
            fatalError()
        }

        constraint.set(priority: priority, isActive: isActive)

        return constraint
    }
}
