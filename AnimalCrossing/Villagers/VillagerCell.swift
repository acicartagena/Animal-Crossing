// Copyright © 2020 ACartagena. All rights reserved.

import UIKit

extension CGFloat {
    static let margin: CGFloat = 16.0
    static let inverseMargin: CGFloat = -1 * margin

    static let interItem: CGFloat = 8.0
    static let inverseInterItem: CGFloat = -1 * interItem
}

class VillagerCell: UICollectionViewCell {

    private let view: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 16.0
        view.backgroundColor = .lightGray
        return view
    }()

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
        contentView.addSubviewsUsingAutoLayout(view)
        view.leadingAnchor.constraint(to: contentView.leadingAnchor, with: CGFloat.margin)
        view.topAnchor.constraint(to: contentView.topAnchor, with: CGFloat.margin/2)
        view.trailingAnchor.constraint(to: contentView.trailingAnchor, with: CGFloat.inverseMargin)
        view.bottomAnchor.constraint(to: contentView.bottomAnchor, with: CGFloat.inverseMargin/2)

        view.addSubviewsUsingAutoLayout(imageView)
        imageView.leadingAnchor.constraint(to: view.leadingAnchor, with: CGFloat.margin)
        imageView.topAnchor.constraint(to: view.topAnchor, with: CGFloat.margin)
        imageView.bottomAnchor.constraint(.lessThanOrEqual, to: view.bottomAnchor, with: CGFloat.inverseMargin)
        imageView.bottomAnchor.constraint(to: view.bottomAnchor, with: CGFloat.inverseMargin, priority: .defaultHigh)
        imageView.widthAnchor.constraint(with: 100.0)
        imageView.heightAnchor.constraint(with: 100.0)
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 50.0

        let stackView = UIStackView(arrangedSubviews: [nameLabel, descriptionLabel])
        stackView.axis = .vertical
        stackView.spacing = CGFloat.interItem

        view.addSubviewsUsingAutoLayout(stackView)
        stackView.leadingAnchor.constraint(to: imageView.trailingAnchor, with: CGFloat.interItem)
        stackView.topAnchor.constraint(to: imageView.topAnchor)
        stackView.trailingAnchor.constraint(.lessThanOrEqual, to: view.trailingAnchor, with: CGFloat.inverseMargin)
        stackView.bottomAnchor.constraint(.lessThanOrEqual, to: view.bottomAnchor, with: CGFloat.inverseMargin)
    }

    func configure(with villager: Villager) {
        nameLabel.text = villager.name
        birthdayLabel.text = ""
        descriptionLabel.text = "\(villager.personality) \(villager.gender) \(villager.species)"
        catchPhraseLabel.text = villager.catchPhrase

        imageView.setImage(villager.imageURL)
    }
}
