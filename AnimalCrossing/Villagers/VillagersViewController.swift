// Copyright © 2020 ACartagena. All rights reserved.

import UIKit

class VillagersViewController: UIViewController {

    let viewModel: VillagersViewModel

    init(viewModel: VillagersViewModel) {
        self.viewModel = viewModel
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

