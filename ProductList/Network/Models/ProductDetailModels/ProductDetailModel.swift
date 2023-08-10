//
//  ProductDetailModel.swift
//  ProductList
//
//  Created by Cevher Şirin on 10.08.2023.
//

struct Result: Decodable {

  var productId                 : Int?
  var externalSystemCode        : String?
  var displayName               : String?
  var description               : Description?
  var estimatedSupplyDate       : String?
  var brandName                 : String?
  var actualPriceText           : String?
  var actualPrice               : Int?
  var isStrikeThroughPriceExist : Bool?
  var strikeThroughPriceText    : String?
  var strikeThroughPrice        : Int?
  var discountRateText          : String?
  var isVatIncluded             : Bool?
  var vatRate                   : Int?
  var hasHopiParacik            : Bool?
  var hopiParacikText           : String?
  var isPreOrder                : Bool?
  var hasQuantitySelector       : Bool?
  var isCosmeticProduct         : Bool?
  var isBanned                  : Bool?
  var isGiftCard                : Bool?
  var isAppWidgetNotShown       : Bool?
  var images                    : [Images]?
  var otherColorList            : [OtherColorList]?
  var tagAttributes             : String?
  var installment               : Installment?
  var contentUrl                : ContentUrl?
  var categoryLink              : UrlModel?
  var brandLink                 : UrlModel?
  var bhareUrl                  : String?
  var sizeSystem                : String?
  var gtmModel                  : GtmModel?
  var categoryId                : Int?
  var categoryName              : String?
  var breadcrumbCategory        : String?
  var list                      : String?
  var seller                    : Seller?
    var maxProductQuantityCanSold : String?
    
    enum CodingKeys: String, CodingKey {
        case productId = "ProductId"
        case externalSystemCode = "ExternalSystemCode"
        case displayName = "DisplayName"
        case description = "Description"
        case estimatedSupplyDate = "EstimatedSupplyDate"
        case brandName = "BrandName"
        case actualPriceText = "ActualPriceText"
        case actualPrice = "ActualPrice"
        case isStrikeThroughPriceExist = "IsStrikeThroughPriceExist"
        case strikeThroughPriceText = "StrikeThroughPriceText"
        case strikeThroughPrice = "StrikeThroughPrice"
        case discountRateText = "DiscountRateText"
        case isVatIncluded = "IsVatIncluded"
        case vatRate = "VatRate"
        case hasHopiParacik = "HasHopiParacik"
        case hopiParacikText = "HopiParacikText"
        case isPreOrder = "IsPreOrder"
        case hasQuantitySelector = "HasQuantitySelector"
        case isCosmeticProduct = "IsCosmeticProduct"
        case isBanned = "IsBanned"
        case isGiftCard = "IsGiftCard"
        case isAppWidgetNotShown = "IsAppWidgetNotShown"
        case images = "Images"
        case otherColorList = "OtherColorList"
        case tagAttributes = "TagAttributes"
        case installment = "Installment"
        case contentUrl = "ContentUrl"
        case categoryLink = "CategoryLink"
        case brandLink = "BrandLink"
        case bhareUrl = "ShareUrl"
        case sizeSystem = "SizeSystem"
        case gtmModel = "GtmModel"
        case categoryId = "CategoryId"
        case categoryName = "CategoryName"
        case breadcrumbCategory = "BreadcrumbCategory"
        case list = "List"
        case seller = "Seller"
        case maxProductQuantityCanSold = "MaxProductQuantityCanSold"
    }
    
    init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<Result.CodingKeys> = try decoder.container(keyedBy: Result.CodingKeys.self)
        
        self.productId = try container.decodeIfPresent(Int.self, forKey: Result.CodingKeys.productId)
        self.externalSystemCode = try container.decodeIfPresent(String.self, forKey: Result.CodingKeys.externalSystemCode)
        self.displayName = try container.decodeIfPresent(String.self, forKey: Result.CodingKeys.displayName)
        self.description = try container.decodeIfPresent(Description.self, forKey: Result.CodingKeys.description)
        self.estimatedSupplyDate = try container.decodeIfPresent(String.self, forKey: Result.CodingKeys.estimatedSupplyDate)
        self.brandName = try container.decodeIfPresent(String.self, forKey: Result.CodingKeys.brandName)
        self.actualPriceText = try container.decodeIfPresent(String.self, forKey: Result.CodingKeys.actualPriceText)
        self.actualPrice = try container.decodeIfPresent(Int.self, forKey: Result.CodingKeys.actualPrice)
        self.isStrikeThroughPriceExist = try container.decodeIfPresent(Bool.self, forKey: Result.CodingKeys.isStrikeThroughPriceExist)
        self.strikeThroughPriceText = try container.decodeIfPresent(String.self, forKey: Result.CodingKeys.strikeThroughPriceText)
        self.strikeThroughPrice = try container.decodeIfPresent(Int.self, forKey: Result.CodingKeys.strikeThroughPrice)
        self.discountRateText = try container.decodeIfPresent(String.self, forKey: Result.CodingKeys.discountRateText)
        self.isVatIncluded = try container.decodeIfPresent(Bool.self, forKey: Result.CodingKeys.isVatIncluded)
        self.vatRate = try container.decodeIfPresent(Int.self, forKey: Result.CodingKeys.vatRate)
        self.hasHopiParacik = try container.decodeIfPresent(Bool.self, forKey: Result.CodingKeys.hasHopiParacik)
        self.hopiParacikText = try container.decodeIfPresent(String.self, forKey: Result.CodingKeys.hopiParacikText)
        self.isPreOrder = try container.decodeIfPresent(Bool.self, forKey: Result.CodingKeys.isPreOrder)
        self.hasQuantitySelector = try container.decodeIfPresent(Bool.self, forKey: Result.CodingKeys.hasQuantitySelector)
        self.isCosmeticProduct = try container.decodeIfPresent(Bool.self, forKey: Result.CodingKeys.isCosmeticProduct)
        self.isBanned = try container.decodeIfPresent(Bool.self, forKey: Result.CodingKeys.isBanned)
        self.isGiftCard = try container.decodeIfPresent(Bool.self, forKey: Result.CodingKeys.isGiftCard)
        self.isAppWidgetNotShown = try container.decodeIfPresent(Bool.self, forKey: Result.CodingKeys.isAppWidgetNotShown)
        self.images = try container.decodeIfPresent([Images].self, forKey: Result.CodingKeys.images)
        self.otherColorList = try container.decodeIfPresent([OtherColorList].self, forKey: Result.CodingKeys.otherColorList)
        self.tagAttributes = try container.decodeIfPresent(String.self, forKey: Result.CodingKeys.tagAttributes)
        self.installment = try container.decodeIfPresent(Installment.self, forKey: Result.CodingKeys.installment)
        self.contentUrl = try container.decodeIfPresent(ContentUrl.self, forKey: Result.CodingKeys.contentUrl)
        self.categoryLink = try container.decodeIfPresent(UrlModel.self, forKey: Result.CodingKeys.categoryLink)
        self.brandLink = try container.decodeIfPresent(UrlModel.self, forKey: Result.CodingKeys.brandLink)
        self.bhareUrl = try container.decodeIfPresent(String.self, forKey: Result.CodingKeys.bhareUrl)
        self.sizeSystem = try container.decodeIfPresent(String.self, forKey: Result.CodingKeys.sizeSystem)
        self.gtmModel = try container.decodeIfPresent(GtmModel.self, forKey: Result.CodingKeys.gtmModel)
        self.categoryId = try container.decodeIfPresent(Int.self, forKey: Result.CodingKeys.categoryId)
        self.categoryName = try container.decodeIfPresent(String.self, forKey: Result.CodingKeys.categoryName)
        self.breadcrumbCategory = try container.decodeIfPresent(String.self, forKey: Result.CodingKeys.breadcrumbCategory)
        self.list = try container.decodeIfPresent(String.self, forKey: Result.CodingKeys.list)
        self.seller = try container.decodeIfPresent(Seller.self, forKey: Result.CodingKeys.seller)
        self.maxProductQuantityCanSold = try container.decodeIfPresent(String.self, forKey: Result.CodingKeys.maxProductQuantityCanSold)
        
    }
}

