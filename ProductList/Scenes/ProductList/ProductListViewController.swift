//
//  ProductListViewController.swift
//  ProductList
//
//  Created by Cevher Şirin on 10.08.2023.
//

class ProductListViewController: BaseViewController<ProductListViewModel> {
    
    private var collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: layout)
        collectionView.register(ProductListCellView.self, forCellWithReuseIdentifier: ProductListCellView.reuseIdentifier)
        collectionView.backgroundColor = .clear
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
       return collectionView
    }()
    
    private let cellHalfWidth = Screen.halfWidth - 15
    private let cellFullWidth = Screen.width - 5

    override func viewDidLoad() {
        super.viewDidLoad()
        subscribeViewModel()
        viewModel.getProductList()
        addSubviews()
        configureContents()
        
        title = "Urunler"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.checkForUserDefaults()
        collectionView.reloadData()
    }
    
    func subscribeViewModel() {
        viewModel.getDataSuccess = { [weak self] in
            guard let self else { return }
            collectionView.reloadData()
        }
        viewModel.reloadCell = { [weak self] indexPath in
            guard let self else { return }
            collectionView.reloadItems(at: [indexPath])
        }
    }
}

//MARK: UI
extension ProductListViewController {
    
    private func addSubviews() {
        addCollectionView()
    }
    
    private func addCollectionView() {
        view.addSubview(collectionView)
        collectionView.edgesToSuperview(usingSafeArea: false)
    }
}

//MARK: Configure
extension ProductListViewController {
    
    private func configureContents() {
        configureCollectionView()
    }
    
    private func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

//MARK: Actions
extension ProductListViewController {
    private func routeToDetail(productId: Int, indexPath: IndexPath) {
        let isFavorited = viewModel.isFavoritedItem(indexPath: indexPath)
        let viewModel = ProductDetailViewModel(productId: productId, isFavorited: isFavorited)
        let viewController = ProductDetailViewController(viewModel: viewModel)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    private func configureContextMenu(indexPath: IndexPath) -> UIContextMenuConfiguration{
        let context = UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { [weak self] (action) -> UIMenu? in
            guard let self else { return nil }
            if self.viewModel.isFavoritedItem(indexPath: indexPath) {
                let fav = UIAction(title: "Remove from Favorites", image: UIImage(named: "heartFilled"), identifier: nil, discoverabilityTitle: nil, state: .off) { [weak self] (_) in
                    guard let self else { return }
                    self.unFavAction(indexPath: indexPath)
                }
                return UIMenu(title: "Options", image: nil, identifier: nil, options: UIMenu.Options.displayInline, children: [fav])
            } else {
                let fav = UIAction(title: "Add to Favorites", image: UIImage(named: "heartEmpty"), identifier: nil, discoverabilityTitle: nil, state: .off) { [weak self] (_) in
                    guard let self else { return }
                    self.favAction(indexPath: indexPath)
                }
                return UIMenu(title: "Options", image: nil, identifier: nil, options: UIMenu.Options.displayInline, children: [fav])
            }
        }
        return context
    }
    
    private func favAction(indexPath: IndexPath) {
        viewModel.addFavAction(indexPath: indexPath)
    }
    
    private func unFavAction(indexPath: IndexPath) {
        viewModel.removeFavAction(indexPath: indexPath)
    }
    
}

//MARK: CollectionView DataSource
extension ProductListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let products = viewModel.products?.productList {
            return products.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let product = viewModel.getProduct(indexPath: indexPath) else { return UICollectionViewCell() }
        let isFavoritedItem = viewModel.isFavoritedItem(indexPath: indexPath)
        let cell: ProductListCellView = collectionView.dequeueReusableCell(for: indexPath)
        let cellModel = ProductListCellViewModel(productId: product.productId, imageUrl: product.imageUrl, productDisplayName: product.displayName, isFavoritedItem: isFavoritedItem)
        cell.setCell(viewModel: cellModel)
        return cell
    }
}

//MARK: CollectionView Delegate
extension ProductListViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let selectedProduct = viewModel.getProduct(indexPath: indexPath) else { return }
        guard let id = selectedProduct.productId else { return }
        routeToDetail(productId: id, indexPath: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
            configureContextMenu(indexPath: indexPath)
    }
}

//MARK: CollectionView FlowLayout
extension ProductListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cellHalfWidth, height: 300)
    }
}
