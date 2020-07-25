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
    private let descriptionLabel = Label()
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
        let stackView = UIStackView(arrangedSubviews: [nameLabel, descriptionLabel])
        stackView.axis = .vertical
        stackView.spacing = CGFloat.interItem

        contentView.addSubviewsUsingAutoLayout(imageView, stackView)

        imageView.leadingAnchor.constraint(to: contentView.leadingAnchor, with: CGFloat.margin)
        imageView.topAnchor.constraint(to: contentView.topAnchor, with: CGFloat.margin)
        imageView.bottomAnchor.constraint(.lessThanOrEqual, to: contentView.bottomAnchor, with: CGFloat.inverseMargin)
        imageView.bottomAnchor.constraint(to: contentView.bottomAnchor, with: CGFloat.inverseMargin, priority: .defaultHigh)
        imageView.widthAnchor.constraint(with: 100.0)
        imageView.heightAnchor.constraint(with: 100.0)
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 50.0

        stackView.leadingAnchor.constraint(to: imageView.trailingAnchor, with: CGFloat.interItem)
        stackView.topAnchor.constraint(to: imageView.topAnchor)
        stackView.trailingAnchor.constraint(to: contentView.trailingAnchor, with: CGFloat.inverseMargin)
        stackView.bottomAnchor.constraint(.lessThanOrEqual, to: contentView.bottomAnchor, with: CGFloat.inverseMargin)

        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 16.0

        contentView.backgroundColor = .lightGray
    }

    func configure(with villager: Villager) {
        nameLabel.text = villager.name
        birthdayLabel.text = ""
        descriptionLabel.text = "\(villager.personality) \(villager.gender) \(villager.species)"
        catchPhraseLabel.text = villager.catchPhrase

        imageView.setImage(villager.imageURL)
    }
}
