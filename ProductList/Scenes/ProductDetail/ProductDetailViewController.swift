//
//  ProductDetailViewController.swift
//  ProductList
//
//  Created by Cevher Şirin on 11.08.2023.
//

class ProductDetailViewController: BaseViewController<ProductDetailViewModel> {
    
    private var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.backgroundColor = .clear
        return stackView
    }()
    
    private var imageCollectionView: UICollectionView = {
        var layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: layout)
        collectionView.register(DetailImageCollectionCellView.self,
                                forCellWithReuseIdentifier: DetailImageCollectionCellView.reuseIdentifier)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        collectionView.isPagingEnabled = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private var pageController: UIPageControl = {
        let pageController = UIPageControl()
        pageController.currentPage = 0
        pageController.isUserInteractionEnabled = false
        return pageController
    }()
    
    private var productFeaturesLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 14)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private var productFeaturesTextView: UITextView = {
       let textView = UITextView()
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.isSelectable = false
        textView.textColor = .darkGray
        textView.font = .systemFont(ofSize: 14)
        textView.textAlignment = .left
        textView.backgroundColor = .clear
        textView.textContainerInset = .init(top: 0, left: 10, bottom: 0, right: 10)
        return textView
    }()
    
    private var favButton: UIButton = {
        let button = UIButton()
        button.width(30)
        button.height(30)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "productBackgroundColor")
        self.navigationController?.navigationBar.tintColor = .black
        viewModel.getProductDetail()
        subscribeViewModel()
        configureContents()
    }
    
    private func subscribeViewModel() {
        viewModel.getDataSuccess = { [weak self] in
            guard let self else { return }
            addSubviews()
            self.imageCollectionView.reloadData()
        }
    }
    
    @objc
    private func favButtonTapped() {
        if viewModel.isFavorited ?? false {
            viewModel.removeFavAction()
        } else {
            viewModel.addFavAction()
        }
        configureFavButton()
    }
}

//MARK: UI
extension ProductDetailViewController {
    
    private func addSubviews() {
        addCollectionView()
        addPageControl()
        addContentStackView()
        addInfoLabels()
        addFavButton()
    }
    
    private func addCollectionView() {
        view.addSubview(imageCollectionView)
        imageCollectionView.edgesToSuperview(excluding: .bottom, insets: .top(0) + .left(0) + .right(0), usingSafeArea: true)
        imageCollectionView.height(400)
    }
    
    private func addPageControl() {
        view.addSubview(pageController)
        pageController.topToBottom(of: imageCollectionView).constant = 5
        pageController.edgesToSuperview(excluding: [.top, .bottom], insets: .left(0) + .right(0))
        pageController.height(30)
        pageController.numberOfPages = self.viewModel.getImagesCount()
    }
    
    private func addContentStackView() {
        view.addSubview(contentStackView)
        contentStackView.topToBottom(of: pageController).constant = 20
        contentStackView.edgesToSuperview(excluding: .top, insets: .bottom(0) + .left(0) + .right(0), usingSafeArea: true)
    }
    
    private func addInfoLabels() {
        // brandNameLabel
        let brandNameLabel = generateInfoLabel(font: .boldSystemFont(ofSize: 15),
                                      textAlignment: .center,
                                      textColor: .black,
                                      text: viewModel.productDetail?.brandName ?? "")
        contentStackView.addArrangedSubview(brandNameLabel)
        
        // productNameLabel
        let productNameLabel = generateInfoLabel(font: .systemFont(ofSize: 15),
                                      textAlignment: .center,
                                      textColor: .darkGray,
                                      text: viewModel.productDetail?.displayName ?? "")
        contentStackView.addArrangedSubview(productNameLabel)
        
        // priceLabel
        let priceLabel = generateInfoLabel(font: .systemFont(ofSize: 15),
                                      textAlignment: .center,
                                      textColor: .darkGray,
                                      text: viewModel.productDetail?.actualPriceText ?? "")
        contentStackView.addArrangedSubview(priceLabel)
        
        addTextView()
        addSpacer()
        
    }
    
    private func addTextView() {
        contentStackView.addArrangedSubview(productFeaturesTextView)
        let featuresText = viewModel.productDetail?.description?.ozellikler ?? ""
        guard let data = featuresText.data(using: .utf16) else { return }
        if let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) {
            productFeaturesTextView.attributedText = attributedString
            productFeaturesTextView.font = .systemFont(ofSize: 14)
            productFeaturesTextView.textColor = .darkGray
        }
    }
    
    private func addSpacer() {
        let spacer = UIView()
        spacer.backgroundColor = .clear
        contentStackView.addArrangedSubview(spacer)
    }
    
    private func addFavButton() {
        view.addSubview(favButton)
        favButton.edgesToSuperview(excluding: [.bottom, .left], insets: .right(20) + .top(20), usingSafeArea: true)
        favButton.addTarget(self, action: #selector(favButtonTapped), for: .touchUpInside)
    }
    
    private func generateInfoLabel(font: UIFont, textAlignment: NSTextAlignment, textColor: UIColor, text: String) -> UILabel {
        let label = UILabel()
        label.textColor = textColor
        label.font = font
        label.textAlignment = textAlignment
        label.numberOfLines = 0
        label.text = text
        return label
    }
}

//MARK: Configure
extension ProductDetailViewController {
    
    private func configureContents() {
        configureCollectionView()
        configureFavButton()
    }
    
    private func configureCollectionView() {
        imageCollectionView.delegate = self
        imageCollectionView.dataSource = self
    }
    
    private func configureFavButton() {
        if viewModel.isFavorited ?? false {
            favButton.setImage(UIImage(named: "heartFilled"), for: .normal)
        } else {
            favButton.setImage(UIImage(named: "heartEmpty"), for: .normal)
        }
    }
}


//MARK: CollectionView DataSource
extension ProductDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getImagesCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let imageList = viewModel.getImageList(indexPath: indexPath)
        let cell: DetailImageCollectionCellView = collectionView.dequeueReusableCell(for: indexPath)
        let cellModel = DetailImageCollectionCellViewModel(imageUrl: imageList[indexPath.item].imageUrl)
        cell.setCell(viewModel: cellModel)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let indexPath = collectionView.indexPathsForVisibleItems.first else { return }
        pageController.currentPage = indexPath.row
    }
}

//MARK: CollectionView Delegate
extension ProductDetailViewController: UICollectionViewDelegate {
}

//MARK: CollectionView FlowLayout
extension ProductDetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Screen.width, height: 400)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
