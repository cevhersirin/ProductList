//
//  SellerModel.swift
//  ProductList
//
//  Created by Cevher Şirin on 10.08.2023.
//

struct Seller: Decodable {
    
    var sellerName: String?
    var sellerTitle: String?
    
    enum CodingKeys:String, CodingKey {
        case sellerName = "SellerName"
        case sellerTitle = "SellerTitle"
    }
    
    init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<Seller.CodingKeys> = try decoder.container(keyedBy: Seller.CodingKeys.self)
        
        self.sellerName = try container.decodeIfPresent(String.self, forKey: Seller.CodingKeys.sellerName)
        self.sellerTitle = try container.decodeIfPresent(String.self, forKey: Seller.CodingKeys.sellerTitle)
        
    }
}
