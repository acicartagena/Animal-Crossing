// Copyright © 2020 ACartagena. All rights reserved.

import UIKit
import Combine

class VillagersViewController: UIViewController {
    typealias DataSource = UICollectionViewDiffableDataSource<VillagersViewModel.Section, Villager>

    private let viewModel: VillagersViewModel
    private var subscriptions = Set<AnyCancellable>()

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: makeCollectionViewLayout())
        collectionView.backgroundColor = .systemGreen
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
        setupBindings()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        viewModel.start()
    }

    func setupUI() {
        navigationItem.title = viewModel.title

        view.addSubviewsUsingAutoLayout(collectionView)

        collectionView.leadingAnchor.constraint(to: view.leadingAnchor)
        collectionView.trailingAnchor.constraint(to: view.trailingAnchor)
        collectionView.topAnchor.constraint(to: view.topAnchor)
        collectionView.bottomAnchor.constraint(to: view.bottomAnchor)
    }

    func setupBindings() {
        viewModel.snapshots.sink { [weak self] snapshot in
            self?.dataSource.apply(snapshot)
        }.store(in: &subscriptions)
    }
}

extension VillagersViewController {
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
