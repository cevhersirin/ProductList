//
//  ProductListViewModel.swift
//  ProductList
//
//  Created by Cevher Şirin on 10.08.2023.
//

import Alamofire

class ProductListViewModel: BaseViewModel {
    
    public var products: Products?
    public var getDataSuccess: VoidClosure?
    
    func getProductList() {
        let url = Endpoints.shared.listUrl
        AF.request(url).validate().responseDecodable(of: BaseResponse<Products>.self) { [weak self] response in
            guard let self else { return }
            self.products = response.value?.result
            print(response)
            self.getDataSuccess?()
        }
    }
    
    func getProduct(indexPath: IndexPath) -> Product? {
        guard let product = products?.productList?[indexPath.row] else { return nil }
        return product
    }
}
