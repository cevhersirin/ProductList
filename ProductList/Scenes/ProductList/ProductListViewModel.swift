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
    public var reloadCell: IndexPathClosure?
    public var favoritedItemIds: [Int]?
    public var listContentMode: ListContentMode = .half
    
    override init() {
        super.init()
        checkForUserDefaults()
    }
    
    func getProductList() {
        let url = Endpoints.shared.listUrl
        AF.request(url).validate().responseDecodable(of: BaseResponse<Products>.self) { [weak self] response in
            guard let self else { return }
            self.products = response.value?.result
            print(response)
            self.getDataSuccess?()
        }
    }
    
    func checkForUserDefaults() {
        if UserDefaults.standard.value(forKey: "firstLaunch") == nil {
            UserDefaults.standard.set(true, forKey: "firstLaunch")
            let array: [Int] = []
            UserDefaults.standard.set(array, forKey: "favorites")
        }
        favoritedItemIds = UserDefaults.standard.value(forKey: "favorites") as? [Int]
    }
    
    func getProduct(indexPath: IndexPath) -> Product? {
        guard let product = products?.productList?[indexPath.row] else { return nil }
        return product
    }
    
    func getProductId(indexPath: IndexPath) -> Int? {
        guard let product = products?.productList?[indexPath.row] else { return nil }
        return product.productId
    }
    
    func addFavAction(indexPath: IndexPath) {
        guard let id = getProductId(indexPath: indexPath) else { return }
        favoritedItemIds?.append(id)
        UserDefaults.standard.set(favoritedItemIds, forKey: "favorites")
        reloadCell?(indexPath)
    }
    
    func removeFavAction(indexPath: IndexPath) {
        guard let id = getProductId(indexPath: indexPath) else { return }
        favoritedItemIds?.removeAll(where: { $0 == id })
        UserDefaults.standard.set(favoritedItemIds, forKey: "favorites")
        reloadCell?(indexPath)
    }
    
    func isFavoritedItem(indexPath: IndexPath) -> Bool {
        guard let id = getProductId(indexPath: indexPath) else { return false }
        guard let favoritedItemIds else { return false }
        return favoritedItemIds.contains(id)
    }
    
}
