//
//  ProductDetailViewModel.swift
//  ProductList
//
//  Created by Cevher Şirin on 11.08.2023.
//

import Alamofire

class ProductDetailViewModel: BaseViewModel {
    
    public func getProductDetail() {
        let url = Endpoints.shared.getDetailUrl(productId: "1240255")
        AF.request(url).validate().responseDecodable(of: BaseResponse<ProductDetail>.self) { [weak self] response in
            guard let self else { return }
            print(response)
        }
    }
    
}
