//
//  OtherColorListModel.swift
//  ProductList
//
//  Created by Cevher Şirin on 10.08.2023.
//

struct OtherColorList: Decodable {
    
    var productId: Int?
    var colorName: String?
    var imageUrl: String?
    var isSelected: Bool?
    
    enum CodingKeys:String, CodingKey {
        case productId = "ProductId"
        case colorName = "ColorName"
        case imageUrl = "ImageUrl"
        case isSelected = "IsSelected"
    }
    
    init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<OtherColorList.CodingKeys> = try decoder.container(keyedBy: OtherColorList.CodingKeys.self)
        
        self.productId = try container.decodeIfPresent(Int.self, forKey: OtherColorList.CodingKeys.productId)
        self.colorName = try container.decodeIfPresent(String.self, forKey: OtherColorList.CodingKeys.colorName)
        self.imageUrl = try container.decodeIfPresent(String.self, forKey: OtherColorList.CodingKeys.imageUrl)
        self.isSelected = try container.decodeIfPresent(Bool.self, forKey: OtherColorList.CodingKeys.isSelected)
        
    }
}

