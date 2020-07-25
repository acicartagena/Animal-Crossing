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
        // Do any additional setup after loading the view.
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
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .estimated(300.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: .fixed(2.0), top: .fixed(2.0), trailing: .fixed(2.0), bottom: .fixed(2.0))

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .estimated(300.0))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}
