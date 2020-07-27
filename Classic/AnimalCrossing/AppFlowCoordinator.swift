// Copyright © 2020 ACartagena. All rights reserved.

import Foundation
import UIKit

class AppFlowCoordinator {
    let initialViewController: UIViewController

    init() {
        let navCon = UINavigationController()
        initialViewController = navCon

        let viewModel = VillagersViewModel()
        let viewController = VillagersViewController(viewModel: viewModel)
        navCon.viewControllers = [viewController]
    }
}
