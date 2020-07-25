// Copyright © 2020 ACartagena. All rights reserved.

import UIKit

class VillagerCell: UICollectionViewCell {

    private let nameLabel = Label()
    private let personalityLabel = Label()
    private let birthdayLabel = Label()
    private let speciesLabel = Label()
    private let genderLabel = Label()
    private let catchPhraseLabel = Label()
    


    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupUI() {

    }
}
