//
//  ProductListViewModel.swift
//  ProductList
//
//  Created by Cevher Şirin on 10.08.2023.
//

import Alamofire

class ProductListViewModel: BaseViewModel {
    
    func getProductList() {
        let url = Endpoints.shared.listUrl
        AF.request(url).validate().responseDecodable(of: BaseResponse<Products>.self) { response in
            print(response)
        }
    }
}
