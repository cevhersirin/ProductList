//
//  SizeListModel.swift
//  ProductList
//
//  Created by Cevher Şirin on 10.08.2023.
//

struct SizeList: Decodable {
    
    var sizeName: String?
    var inStock: Bool?
    var variantId: Int?
    
    enum CodingKeys: String, CodingKey {
        case sizeName = "SizeName"
        case inStock = "InStock"
        case variantId = "VariantId"
    }
    
    init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<SizeList.CodingKeys> = try decoder.container(keyedBy: SizeList.CodingKeys.self)
        
        self.sizeName = try container.decodeIfPresent(String.self, forKey: SizeList.CodingKeys.sizeName)
        self.inStock = try container.decodeIfPresent(Bool.self, forKey: SizeList.CodingKeys.inStock)
        self.variantId = try container.decodeIfPresent(Int.self, forKey: SizeList.CodingKeys.variantId)
        
    }
}
