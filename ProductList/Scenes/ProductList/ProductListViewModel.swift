//
//  ProductListViewModel.swift
//  ProductList
//
//  Created by Cevher Şirin on 10.08.2023.
//

import Alamofire

class ProductListViewModel: BaseViewModel {
    
    public var products: Products?
    public var productList: [Product]? = []
    public var getDataSuccess: VoidClosure?
    public var reloadCell: IndexPathClosure?
    public var favoritedItemIds: [Int]?
    public var listContentMode: ListContentMode = .half
    public var totalPageCount: Int = 0
    public var currentPage = 1
    
    override init() {
        super.init()
        checkForUserDefaults()
    }
    
    func getProductList() {
        showLoading?()
        let url = Endpoints.shared.getListUrl(page: currentPage)
        AF.request(url).validate().responseDecodable(of: BaseResponse<Products>.self) { [weak self] response in
            guard let self else { return }
            hideLoading?()
            self.products = response.value?.result
            self.productList? += response.value?.result?.productList ?? []
            self.totalPageCount = response.value?.result?.totalPageCount ?? totalPageCount
            self.currentPage += 1
            self.getDataSuccess?()
        }
    }
    
    func getProductCount() -> Int {
        return productList?.count ?? 0
    }
    
    func checkForUserDefaults() {
        if UserDefaults.standard.value(forKey: UserDefaultKeys.shared.firstLaunch) == nil {
            UserDefaults.standard.set(true, forKey: UserDefaultKeys.shared.firstLaunch)
            let array: [Int] = []
            UserDefaults.standard.set(array, forKey: UserDefaultKeys.shared.favorites)
        }
        favoritedItemIds = UserDefaults.standard.value(forKey: UserDefaultKeys.shared.favorites) as? [Int]
    }
    
    func getProduct(indexPath: IndexPath) -> Product? {
        guard let product = productList?[indexPath.row] else { return nil }
        return product
    }
    
    func getProductId(indexPath: IndexPath) -> Int? {
        guard let product = productList?[indexPath.row] else { return nil }
        return product.productId
    }
    
    func addFavAction(indexPath: IndexPath) {
        guard let id = getProductId(indexPath: indexPath) else { return }
        favoritedItemIds?.append(id)
        UserDefaults.standard.set(favoritedItemIds, forKey: UserDefaultKeys.shared.favorites)
        EntryKitManager.showBottomMessage(title: StringConstants.shared.addedFavoritedTitle,
                                          desc: StringConstants.shared.addedFavoritedTitle,
                                          textColor: .white,
                                          imageName: "heartSmile")
        reloadCell?(indexPath)
    }
    
    func removeFavAction(indexPath: IndexPath) {
        guard let id = getProductId(indexPath: indexPath) else { return }
        favoritedItemIds?.removeAll(where: { $0 == id })
        UserDefaults.standard.set(favoritedItemIds, forKey: UserDefaultKeys.shared.favorites)
        EntryKitManager.showBottomMessage(title: StringConstants.shared.removedFavoritedTitle,
                                          desc: StringConstants.shared.removedFavoritedDesc,
                                          textColor: .white,
                                          imageName: "heartCross")
        reloadCell?(indexPath)
    }
    
    func isFavoritedItem(indexPath: IndexPath) -> Bool {
        guard let id = getProductId(indexPath: indexPath) else { return false }
        guard let favoritedItemIds else { return false }
        return favoritedItemIds.contains(id)
    }
    
}
