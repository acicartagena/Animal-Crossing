// Copyright © 2020 ACartagena. All rights reserved.

import UIKit

class VillagersViewController: UIViewController {
    typealias DataSource = UICollectionViewDiffableDataSource<VillagersViewModel.Section, Villager>

    private let viewModel: VillagersViewModel

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: makeCollectionViewLayout())
        collectionView.backgroundColor = .white
        collectionView.register(VillagerCell.self)
        return collectionView
    }()

    private lazy var dataSource = DataSource(collectionView: collectionView) { (collectionView, indexPath, villager)  in
        let cell: VillagerCell = collectionView.dequeCell(for: indexPath)
        cell.configure(with: villager)
        return cell
    }

    init(viewModel: VillagersViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        dataSource.apply(viewModel.snapshot)
    }

    func setupUI() {
        navigationItem.title = viewModel.title

        view.addSubviewsUsingAutoLayout(collectionView)

        collectionView.leadingAnchor.constraint(to: view.leadingAnchor)
        collectionView.trailingAnchor.constraint(to: view.trailingAnchor)
        collectionView.topAnchor.constraint(to: view.topAnchor)
        collectionView.bottomAnchor.constraint(to: view.bottomAnchor)
    }

    func makeCollectionViewLayout() -> UICollectionViewLayout {
        let size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .estimated(100.0))
        let item = NSCollectionLayoutItem(layoutSize: size)
        let group = NSCollectionLayoutGroup.vertical(layoutSize: size,
                                                       subitems: [item])
        group.interItemSpacing = .fixed(CGFloat.margin)

        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}
