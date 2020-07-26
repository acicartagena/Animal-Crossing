// Copyright © 2020 ACartagena. All rights reserved.

import UIKit

class Label: UILabel {

    init(textStyle: UIFont.TextStyle = .body, textColor: UIColor = .systemGray) {
        super.init(frame: .zero)

        font = UIFont.preferredFont(forTextStyle: textStyle)
        adjustsFontForContentSizeCategory = true
        numberOfLines = 0
        self.textColor = textColor
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
