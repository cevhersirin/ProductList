//
//  DetailImageCollectionCellView.swift
//  ProductList
//
//  Created by Cevher Şirin on 11.08.2023.
//

class DetailImageCollectionCellView: UICollectionViewCell, ReusableView {
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
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
extension DetailImageCollectionCellView {
    private func addSubviews() {
        addSubview(imageView)
        imageView.edgesToSuperview()
    }
}

//MARK: Configure
extension DetailImageCollectionCellView {
    
    public func setCell(viewModel: DetailImageCollectionCellViewModel) {
        if let imageUrl = viewModel.imageUrl, let url = URL(string: imageUrl) {
            imageView.kf.setImage(with: url)
        }
    }
}
