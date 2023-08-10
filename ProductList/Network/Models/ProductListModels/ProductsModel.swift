//
//  ProductsModel.swift
//  ProductList
//
//  Created by Cevher Şirin on 10.08.2023.
//

struct Products: Decodable {
    var productList: [ProductList]?
    var filters: String?
    var contentList: String?
    var orderOption: String?
    var totalItemCount: Int?
    var totalPageCount: Int?
    var customFilters: CustomFilters?
    var sliderList: String?
    var category: String?
    var categoryId: Int?
    var list: String?
    var bannerList: String?
    var shareLink: String?
    var sizeConstant: String?
    var twentyFourHoursCargoIsActive: Bool?
    
    enum CodingKeys: String, CodingKey {
        case productList = "ProductList"
        case filters = "Filters"
        case contentList = "ContentList"
        case orderOption = "OrderOption"
        case totalItemCount = "TotalItemCount"
        case totalPageCount = "TotalPageCount"
        case customFilters = "CustomFilters"
        case sliderList = "SliderList"
        case category = "Category"
        case categoryId = "CategoryId"
        case list = "List"
        case bannerList = "BannerList"
        case shareLink = "ShareLink"
        case sizeConstant = "SizeConstant"
        case twentyFourHoursCargoIsActive = "TwentyFourHoursCargoIsActive"
    }
    
    init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<Products.CodingKeys> = try decoder.container(keyedBy: Products.CodingKeys.self)
        
        self.productList = try container.decodeIfPresent([ProductList].self, forKey: Products.CodingKeys.productList)
        self.filters = try container.decodeIfPresent(String.self, forKey: Products.CodingKeys.filters)
        self.contentList = try container.decodeIfPresent(String.self, forKey: Products.CodingKeys.contentList)
        self.orderOption = try container.decodeIfPresent(String.self, forKey: Products.CodingKeys.orderOption)
        self.totalItemCount = try container.decodeIfPresent(Int.self, forKey: Products.CodingKeys.totalItemCount)
        self.totalPageCount = try container.decodeIfPresent(Int.self, forKey: Products.CodingKeys.totalPageCount)
        self.customFilters = try container.decodeIfPresent(CustomFilters.self, forKey: Products.CodingKeys.customFilters)
        self.sliderList = try container.decodeIfPresent(String.self, forKey: Products.CodingKeys.sliderList)
        self.category = try container.decodeIfPresent(String.self, forKey: Products.CodingKeys.category)
        self.categoryId = try container.decodeIfPresent(Int.self, forKey: Products.CodingKeys.categoryId)
        self.list = try container.decodeIfPresent(String.self, forKey: Products.CodingKeys.list)
        self.bannerList = try container.decodeIfPresent(String.self, forKey: Products.CodingKeys.bannerList)
        self.shareLink = try container.decodeIfPresent(String.self, forKey: Products.CodingKeys.shareLink)
        self.sizeConstant = try container.decodeIfPresent(String.self, forKey: Products.CodingKeys.sizeConstant)
        self.twentyFourHoursCargoIsActive = try container.decodeIfPresent(Bool.self, forKey: Products.CodingKeys.twentyFourHoursCargoIsActive)
        
    }
}
