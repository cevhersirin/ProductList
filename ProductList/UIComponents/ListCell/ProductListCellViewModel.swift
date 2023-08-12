//
//  ProductListCellViewModel.swift
//  ProductList
//
//  Created by Cevher Şirin on 11.08.2023.
//

class ProductListCellViewModel {
    
    var productId: Int?
    var imageUrl: String?
    var productDisplayName: String?
    var isFavoritedItem: Bool?
    
    public init(productId: Int?, imageUrl: String?, productDisplayName: String?, isFavoritedItem: Bool?) {
        self.productId = productId
        self.imageUrl = imageUrl
        self.productDisplayName = productDisplayName
        self.isFavoritedItem = isFavoritedItem
    }
}
