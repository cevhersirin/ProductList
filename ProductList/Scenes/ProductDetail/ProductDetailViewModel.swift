//
//  ProductDetailViewModel.swift
//  ProductList
//
//  Created by Cevher Şirin on 11.08.2023.
//

import Alamofire

class ProductDetailViewModel: BaseViewModel {
    
    public var productId: Int?
    public var productDetail: ProductDetail?
    
    public init(productId: Int?) {
        self.productId = productId
    }
    
    var getDataSuccess: VoidClosure?
    
    public func getProductDetail() {
        guard let id = productId else { return }
        let productId = String(id)
        showLoading?()
        let url = Endpoints.shared.getDetailUrl(productId: productId)
        AF.request(url).validate().responseDecodable(of: BaseResponse<ProductDetail>.self) { [weak self] response in
            guard let self else { return }
            self.hideLoading?()
            self.productDetail = response.value?.result
            getDataSuccess?()
            print(response)
        }
    }
    
    public func getImagesCount() -> Int {
        var imageList: [Image] = []
        guard let images = productDetail?.images else { return 0 }
        for image in images {
            if let item = image.images?.first(where: {$0.sizeCode == .original}) {
                imageList.append(item)
            }
        }
        return imageList.count
    }
    
    public func getImageList(indexPath: IndexPath) -> [Image] {
        var imageList: [Image] = []
        guard let images = productDetail?.images else { return imageList }
        for image in images {
            if let item = image.images?.first(where: {$0.sizeCode == .original}) {
                imageList.append(item)
            }
        }
        return imageList
    }
}