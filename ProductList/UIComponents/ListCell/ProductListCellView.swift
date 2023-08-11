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
        stack.setCornerRadius(radius: 10)
        stack.clipsToBounds = true
        return stack
    }()
    
    private var imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private var displayNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .white
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
        addContentStackView()
        addImageView()
        addDisplayNameLabe()
    }
    
    private func addContentStackView() {
        addSubview(contentStackView)
        contentStackView.edgesToSuperview(insets: .bottom(10) + .left(10) + .top(10) + .right(10))
    }
    
    private func addImageView() {
        contentStackView.addArrangedSubview(imageView)
    }
    
    private func addDisplayNameLabe() {
        contentStackView.addArrangedSubview(displayNameLabel)
    }
}

//MARK: Configure
extension ProductListCellView {
    
    public func setCell(viewModel: ProductListCellViewModel) {
        if let imageUrl = viewModel.imageUrl, let url = URL(string: imageUrl) {
            imageView.kf.setImage(with: url)
        }
        displayNameLabel.text = viewModel.productDisplayName
    }
}
