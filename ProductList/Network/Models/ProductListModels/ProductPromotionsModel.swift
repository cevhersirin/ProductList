//
//  ProductPromotionsModel.swift
//  ProductList
//
//  Created by Cevher Şirin on 11.08.2023.
//

struct ProductPromotions: Decodable {
    
    var productId: Int?
    var campaignId: Int?
    var promotedPrice: Double?
    var campaignDesc: String?
    var campaignTitle: String?
    var promotedPriceText: String?
    var showPrice: Bool?
    var showOnWeb: Bool?
    var showOnMobile: Bool?
    var showOnApp: Bool?
    
    enum CodingKeys: String, CodingKey {
        case productId = "ProductId"
        case campaignId = "CampaignId"
        case promotedPrice = "PromotedPrice"
        case campaignDesc = "CampaignDesc"
        case campaignTitle = "CampaignTitle"
        case promotedPriceText = "PromotedPriceText"
        case showPrice = "ShowPrice"
        case showOnWeb = "ShowOnWeb"
        case showOnMobile = "ShowOnMobile"
        case showOnApp = "ShowOnApp"
    }
    
    init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<ProductPromotions.CodingKeys> = try decoder.container(keyedBy: ProductPromotions.CodingKeys.self)
        
        self.productId = try container.decodeIfPresent(Int.self, forKey: ProductPromotions.CodingKeys.productId)
        self.campaignId = try container.decodeIfPresent(Int.self, forKey: ProductPromotions.CodingKeys.campaignId)
        self.promotedPrice = try container.decodeIfPresent(Double.self, forKey: ProductPromotions.CodingKeys.promotedPrice)
        self.campaignDesc = try container.decodeIfPresent(String.self, forKey: ProductPromotions.CodingKeys.campaignDesc)
        self.campaignTitle = try container.decodeIfPresent(String.self, forKey: ProductPromotions.CodingKeys.campaignTitle)
        self.promotedPriceText = try container.decodeIfPresent(String.self, forKey: ProductPromotions.CodingKeys.promotedPriceText)
        self.showPrice = try container.decodeIfPresent(Bool.self, forKey: ProductPromotions.CodingKeys.showPrice)
        self.showOnWeb = try container.decodeIfPresent(Bool.self, forKey: ProductPromotions.CodingKeys.showOnWeb)
        self.showOnMobile = try container.decodeIfPresent(Bool.self, forKey: ProductPromotions.CodingKeys.showOnMobile)
        self.showOnApp = try container.decodeIfPresent(Bool.self, forKey: ProductPromotions.CodingKeys.showOnApp)
        
    }
}
