// Copyright © 2020 ACartagena. All rights reserved.

import UIKit

class Label: UILabel {

    init(textStyle: UIFont.TextStyle = .body) {
        super.init(frame: .zero)

        font = UIFont.preferredFont(forTextStyle: textStyle)
        adjustsFontForContentSizeCategory = true
        numberOfLines = 0
        textColor = .systemGray
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
