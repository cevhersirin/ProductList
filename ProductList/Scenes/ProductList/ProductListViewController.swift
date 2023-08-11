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
       return collectionView
    }()
    
    private let cellHalfWidth = Screen.halfWidth - 5
    private let cellFullWidth = Screen.width - 5

    override func viewDidLoad() {
        super.viewDidLoad()
        subscribeViewModel()
        viewModel.getProductList()
        addSubviews()
        configureContents()
        
        title = "Urunler"
        
        let button = UIButton()
        view.addSubview(button)
        button.setTitle("Push", for: .normal)
        button.centerInSuperview()
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    @objc
    func buttonAction() {
        let viewModel = ProductDetailViewModel()
        let detailVC = ProductDetailViewController(viewModel: viewModel)
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func subscribeViewModel() {
        viewModel.getDataSuccess = { [weak self] in
            guard let self else { return }
            collectionView.reloadData()
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
        let cell: ProductListCellView = collectionView.dequeueReusableCell(for: indexPath)
        let cellModel = ProductListCellViewModel(productId: product.productId, imageUrl: product.imageUrl, productDisplayName: product.displayName)
        cell.setCell(viewModel: cellModel)
        return cell
    }
}

//MARK: CollectionView Delegate
extension ProductListViewController: UICollectionViewDelegate {
    
    
}

//MARK: CollectionView FlowLayout
extension ProductListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cellHalfWidth, height: 300)
    }
}
