//
//  ProductListModel.swift
//  ProductList
//
//  Created by Cevher Şirin on 10.08.2023.
//

struct Product: Decodable {
    var productId: Int?
    var externalSystemCode: String?
    var displayName: String?
    var brandName: String?
    var imageUrl: String?
    var imageUrls: [String]?
    var strikeThroughPriceToShowOnScreenText : String?
    var strikeThroughPriceToShowOnScreen: Double?
    var actualPriceToShowOnScreenText: String?
    var actualPriceToShowOnScreen: Double?
    var isStrikeThroughPriceExists: Bool?
    var discountRate: Int?
    var price: Double?
    var cdnResizedImageUrl: String?
    var secondPrice: Double?
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
    var productPromotions: [ProductPromotions]?
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
        let container: KeyedDecodingContainer<Product.CodingKeys> = try decoder.container(keyedBy: Product.CodingKeys.self)
        
        self.productId = try container.decodeIfPresent(Int.self, forKey: Product.CodingKeys.productId)
        self.externalSystemCode = try container.decodeIfPresent(String.self, forKey: Product.CodingKeys.externalSystemCode)
        self.displayName = try container.decodeIfPresent(String.self, forKey: Product.CodingKeys.displayName)
        self.brandName = try container.decodeIfPresent(String.self, forKey: Product.CodingKeys.brandName)
        self.imageUrl = try container.decodeIfPresent(String.self, forKey: Product.CodingKeys.imageUrl)
        self.imageUrls = try container.decodeIfPresent([String].self, forKey: Product.CodingKeys.imageUrls)
        self.strikeThroughPriceToShowOnScreenText = try container.decodeIfPresent(String.self, forKey: Product.CodingKeys.strikeThroughPriceToShowOnScreenText)
        self.strikeThroughPriceToShowOnScreen = try container.decodeIfPresent(Double.self, forKey: Product.CodingKeys.strikeThroughPriceToShowOnScreen)
        self.actualPriceToShowOnScreenText = try container.decodeIfPresent(String.self, forKey: Product.CodingKeys.actualPriceToShowOnScreenText)
        self.actualPriceToShowOnScreen = try container.decodeIfPresent(Double.self, forKey: Product.CodingKeys.actualPriceToShowOnScreen)
        self.isStrikeThroughPriceExists = try container.decodeIfPresent(Bool.self, forKey: Product.CodingKeys.isStrikeThroughPriceExists)
        self.discountRate = try container.decodeIfPresent(Int.self, forKey: Product.CodingKeys.discountRate)
        self.price = try container.decodeIfPresent(Double.self, forKey: Product.CodingKeys.price)
        self.cdnResizedImageUrl = try container.decodeIfPresent(String.self, forKey: Product.CodingKeys.cdnResizedImageUrl)
        self.secondPrice = try container.decodeIfPresent(Double.self, forKey: Product.CodingKeys.secondPrice)
        self.secondPriceText = try container.decodeIfPresent(String.self, forKey: Product.CodingKeys.secondPriceText)
        self.showDefaultDiscountRate = try container.decodeIfPresent(Bool.self, forKey: Product.CodingKeys.showDefaultDiscountRate)
        self.newDiscountRateText = try container.decodeIfPresent(String.self, forKey: Product.CodingKeys.newDiscountRateText)
        self.newDiscountRate = try container.decodeIfPresent(Int.self, forKey: Product.CodingKeys.newDiscountRate)
        self.sizeSystem = try container.decodeIfPresent(String.self, forKey: Product.CodingKeys.sizeSystem)
        self.isOutOfStock = try container.decodeIfPresent(Bool.self, forKey: Product.CodingKeys.isOutOfStock)
        self.sizeList = try container.decodeIfPresent([SizeList].self, forKey: Product.CodingKeys.sizeList)
        self.color = try container.decodeIfPresent(String.self, forKey: Product.CodingKeys.color)
        self.standartSize = try container.decodeIfPresent(String.self, forKey: Product.CodingKeys.standartSize)
        self.matchedVariantId = try container.decodeIfPresent(String.self, forKey: Product.CodingKeys.matchedVariantId)
        self.productPromotions = try container.decodeIfPresent([ProductPromotions].self, forKey: Product.CodingKeys.productPromotions)
        self.productBadges = try container.decodeIfPresent([String].self, forKey: Product.CodingKeys.productBadges)
        self.isAdProduct = try container.decodeIfPresent(Bool.self, forKey: Product.CodingKeys.isAdProduct)
        self.productAdId = try container.decodeIfPresent(String.self, forKey: Product.CodingKeys.productAdId)
        self.productAdvertiserId = try container.decodeIfPresent(String.self, forKey: Product.CodingKeys.productAdvertiserId)
        self.gowitDisplayText = try container.decodeIfPresent(String.self, forKey: Product.CodingKeys.gowitDisplayText)
        self.advertiserUri = try container.decodeIfPresent(String.self, forKey: Product.CodingKeys.advertiserUri)
        
    }
}

