// Copyright © 2020 ACartagena. All rights reserved.

import UIKit

extension CGFloat {
    static let margin: CGFloat = 16.0
    static let inverseMargin: CGFloat = -1 * margin

    static let interItem: CGFloat = 8.0
    static let inverseInterItem: CGFloat = -1 * interItem
}

class VillagerCell: UICollectionViewCell {

    private let nameLabel = Label()
    private let personalityLabel = Label()
    private let birthdayLabel = Label()
    private let speciesLabel = Label()
    private let genderLabel = Label()
    private let catchPhraseLabel = Label()
    private let imageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        imageView.prepareForReuse()
    }

    func setupUI() {
        let stackView = UIStackView(arrangedSubviews: [nameLabel, speciesLabel, genderLabel, personalityLabel])
        stackView.axis = .vertical
        stackView.spacing = CGFloat.interItem

        contentView.addSubviewsUsingAutoLayout(imageView, stackView)

        imageView.leadingAnchor.constraint(to: contentView.leadingAnchor, with: CGFloat.margin)
        imageView.topAnchor.constraint(to: contentView.topAnchor, with: CGFloat.margin)
        imageView.bottomAnchor.constraint(.greaterThanOrEqual, to: contentView.bottomAnchor, with: CGFloat.inverseMargin)

        stackView.leadingAnchor.constraint(to: imageView.trailingAnchor, with: CGFloat.interItem)
        stackView.topAnchor.constraint(to: imageView.topAnchor)
        stackView.trailingAnchor.constraint(to: contentView.trailingAnchor, with: CGFloat.inverseMargin)
        stackView.bottomAnchor.constraint(.greaterThanOrEqual, to: contentView.bottomAnchor, with: CGFloat.inverseMargin)
    }

    func configure(with villager: Villager) {
        nameLabel.text = villager.name
        personalityLabel.text = villager.personality
        birthdayLabel.text = ""
        speciesLabel.text = villager.species
        genderLabel.text = villager.gender
        catchPhraseLabel.text = villager.catchPhrase

        imageView.setImage(villager.imageURL)
    }
}
