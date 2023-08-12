//
//  ProductListCellView.swift
//  ProductList
//
//  Created by Cevher Şirin on 11.08.2023.
//

import Kingfisher

class ProductListCellView: UICollectionViewCell, ReusableView {
    
    private var contentStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = .zero
        stack.backgroundColor = .clear
        stack.setTopCornerRadius(radius: 10)
        stack.clipsToBounds = true
        return stack
    }()
    
    private var imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private var favoritedImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private var informationsStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = .zero
        stack.backgroundColor = UIColor.init(named: "productBackgroundColor")
        stack.setBottomCornerRadius(radius: 10)
        stack.clipsToBounds = true
        return stack
    }()
    
    private var displayNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .darkGray
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        
    }
}

//MARK: UI
extension ProductListCellView {
    
    private func addSubviews() {
        backgroundColor = UIColor.init(named: "productBackgroundColor")
        self.setCornerRadius(radius: 10)
        addContentStackView()
        addInformationStack()
        addFavoritedImage()
    }
    
    private func addContentStackView() {
        addSubview(contentStackView)
        contentStackView.edgesToSuperview(excluding: .bottom, insets: .left(0) + .top(0) + .right(0))
        addImageView()
    }
    
    private func addImageView() {
        contentStackView.addArrangedSubview(imageView)
    }
    
    private func addInformationStack() {
        addSubview(informationsStackView)
        informationsStackView.topToBottom(of: contentStackView).constant = 5
        informationsStackView.edgesToSuperview(excluding: .top, insets: .left(5) + .bottom(0) + .right(5))
        informationsStackView.height(60)
        addDisplayNameLabe()
        addSpacer()
    }
    
    private func addDisplayNameLabe() {
        informationsStackView.addArrangedSubview(displayNameLabel)
    }
    
    private func addSpacer() {
        let spacer = UIView()
        spacer.backgroundColor = .clear
        informationsStackView.addArrangedSubview(spacer)
    }
    
    private func addFavoritedImage() {
        addSubview(favoritedImageView)
        favoritedImageView.edgesToSuperview(excluding: [.bottom, .left], insets: .right(5) + .top(5))
        favoritedImageView.width(20)
        favoritedImageView.height(20)
    }
}

//MARK: Configure
extension ProductListCellView {
    
    public func setCell(viewModel: ProductListCellViewModel) {
        if let imageUrl = viewModel.imageUrl, let url = URL(string: imageUrl) {
            imageView.kf.setImage(with: url)
        }
        displayNameLabel.text = viewModel.productDisplayName
        
        if viewModel.isFavoritedItem ?? false {
            favoritedImageView.isHidden = false
            favoritedImageView.image = UIImage(named: "heartFilled")
        } else {
            favoritedImageView.isHidden = true
        }
    }
}
