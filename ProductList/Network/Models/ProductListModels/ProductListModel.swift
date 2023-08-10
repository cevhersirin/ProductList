//
//  ProductListModel.swift
//  ProductList
//
//  Created by Cevher Şirin on 10.08.2023.
//

struct ProductList: Decodable {
    var productId: Int?
    var externalSystemCode: String?
    var displayName: String?
    var brandName: String?
    var imageUrl: String?
    var imageUrls: [String]?
    var strikeThroughPriceToShowOnScreenText : String?
    var strikeThroughPriceToShowOnScreen: Int?
    var actualPriceToShowOnScreenText: String?
    var actualPriceToShowOnScreen: Int?
    var isStrikeThroughPriceExists: Bool?
    var discountRate: String?
    var price: Int?
    var cdnResizedImageUrl: String?
    var secondPrice: Int?
    var secondPriceText: String?
    var showDefaultDiscountRate: Bool?
    var newDiscountRateText: String?
    var newDiscountRate: Int?
    var sizeSystem: String?
    var isOutOfStock: Bool?
    var sizeList: [SizeList]?
    var color: String?
    var standartSize: String?
    var matchedVariantId: String?
    var productPromotions: [String]?
    var productBadges: [String]?
    var isAdProduct: Bool?
    var productAdId: String?
    var productAdvertiserId: String?
    var gowitDisplayText: String?
    var advertiserUri: String?
    
    enum CodingKeys: String, CodingKey {
        case productId = "ProductId"
        case externalSystemCode = "ExternalSystemCode"
        case displayName = "DisplayName"
        case brandName = "BrandName"
        case imageUrl = "ImageUrl"
        case imageUrls = "ImageUrls"
        case strikeThroughPriceToShowOnScreenText = "StrikeThroughPriceToShowOnScreenText"
        case strikeThroughPriceToShowOnScreen = "StrikeThroughPriceToShowOnScreen"
        case actualPriceToShowOnScreenText = "ActualPriceToShowOnScreenText"
        case actualPriceToShowOnScreen = "ActualPriceToShowOnScreen"
        case isStrikeThroughPriceExists = "IsStrikeThroughPriceExists"
        case discountRate = "DiscountRate"
        case price = "Price"
        case cdnResizedImageUrl = "CdnResizedImageUrl"
        case secondPrice = "SecondPrice"
        case secondPriceText = "SecondPriceText"
        case showDefaultDiscountRate = "ShowDefaultDiscountRate"
        case newDiscountRateText = "NewDiscountRateText"
        case newDiscountRate = "NewDiscountRate"
        case sizeSystem = "SizeSystem"
        case isOutOfStock = "IsOutOfStock"
        case sizeList = "SizeList"
        case color = "Color"
        case standartSize = "StandartSize"
        case matchedVariantId = "MatchedVariantId"
        case productPromotions = "ProductPromotions"
        case productBadges = "ProductBadges"
        case isAdProduct = "IsAdProduct"
        case productAdId = "ProductAdId"
        case productAdvertiserId = "ProductAdvertiserId"
        case gowitDisplayText = "GowitDisplayText"
        case advertiserUri = "AdvertiserUri"
    }
    
    init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<ProductList.CodingKeys> = try decoder.container(keyedBy: ProductList.CodingKeys.self)
        
        self.productId = try container.decodeIfPresent(Int.self, forKey: ProductList.CodingKeys.productId)
        self.externalSystemCode = try container.decodeIfPresent(String.self, forKey: ProductList.CodingKeys.externalSystemCode)
        self.displayName = try container.decodeIfPresent(String.self, forKey: ProductList.CodingKeys.displayName)
        self.brandName = try container.decodeIfPresent(String.self, forKey: ProductList.CodingKeys.brandName)
        self.imageUrl = try container.decodeIfPresent(String.self, forKey: ProductList.CodingKeys.imageUrl)
        self.imageUrls = try container.decodeIfPresent([String].self, forKey: ProductList.CodingKeys.imageUrls)
        self.strikeThroughPriceToShowOnScreenText = try container.decodeIfPresent(String.self, forKey: ProductList.CodingKeys.strikeThroughPriceToShowOnScreenText)
        self.strikeThroughPriceToShowOnScreen = try container.decodeIfPresent(Int.self, forKey: ProductList.CodingKeys.strikeThroughPriceToShowOnScreen)
        self.actualPriceToShowOnScreenText = try container.decodeIfPresent(String.self, forKey: ProductList.CodingKeys.actualPriceToShowOnScreenText)
        self.actualPriceToShowOnScreen = try container.decodeIfPresent(Int.self, forKey: ProductList.CodingKeys.actualPriceToShowOnScreen)
        self.isStrikeThroughPriceExists = try container.decodeIfPresent(Bool.self, forKey: ProductList.CodingKeys.isStrikeThroughPriceExists)
        self.discountRate = try container.decodeIfPresent(String.self, forKey: ProductList.CodingKeys.discountRate)
        self.price = try container.decodeIfPresent(Int.self, forKey: ProductList.CodingKeys.price)
        self.cdnResizedImageUrl = try container.decodeIfPresent(String.self, forKey: ProductList.CodingKeys.cdnResizedImageUrl)
        self.secondPrice = try container.decodeIfPresent(Int.self, forKey: ProductList.CodingKeys.secondPrice)
        self.secondPriceText = try container.decodeIfPresent(String.self, forKey: ProductList.CodingKeys.secondPriceText)
        self.showDefaultDiscountRate = try container.decodeIfPresent(Bool.self, forKey: ProductList.CodingKeys.showDefaultDiscountRate)
        self.newDiscountRateText = try container.decodeIfPresent(String.self, forKey: ProductList.CodingKeys.newDiscountRateText)
        self.newDiscountRate = try container.decodeIfPresent(Int.self, forKey: ProductList.CodingKeys.newDiscountRate)
        self.sizeSystem = try container.decodeIfPresent(String.self, forKey: ProductList.CodingKeys.sizeSystem)
        self.isOutOfStock = try container.decodeIfPresent(Bool.self, forKey: ProductList.CodingKeys.isOutOfStock)
        self.sizeList = try container.decodeIfPresent([SizeList].self, forKey: ProductList.CodingKeys.sizeList)
        self.color = try container.decodeIfPresent(String.self, forKey: ProductList.CodingKeys.color)
        self.standartSize = try container.decodeIfPresent(String.self, forKey: ProductList.CodingKeys.standartSize)
        self.matchedVariantId = try container.decodeIfPresent(String.self, forKey: ProductList.CodingKeys.matchedVariantId)
        self.productPromotions = try container.decodeIfPresent([String].self, forKey: ProductList.CodingKeys.productPromotions)
        self.productBadges = try container.decodeIfPresent([String].self, forKey: ProductList.CodingKeys.productBadges)
        self.isAdProduct = try container.decodeIfPresent(Bool.self, forKey: ProductList.CodingKeys.isAdProduct)
        self.productAdId = try container.decodeIfPresent(String.self, forKey: ProductList.CodingKeys.productAdId)
        self.productAdvertiserId = try container.decodeIfPresent(String.self, forKey: ProductList.CodingKeys.productAdvertiserId)
        self.gowitDisplayText = try container.decodeIfPresent(String.self, forKey: ProductList.CodingKeys.gowitDisplayText)
        self.advertiserUri = try container.decodeIfPresent(String.self, forKey: ProductList.CodingKeys.advertiserUri)
        
    }
}

