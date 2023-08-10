//
//  ImagesModel.swift
//  ProductList
//
//  Created by Cevher Şirin on 10.08.2023.
//

struct Images: Decodable {
    
    var displayOrder : Int?      = nil
    var images       : [Images]? = []
    
    enum CodingKeys: String, CodingKey {
        case displayOrder = "DisplayOrder"
        case images = "Images"
    }
    
    init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<Images.CodingKeys> = try decoder.container(keyedBy: Images.CodingKeys.self)
        
        self.displayOrder = try container.decodeIfPresent(Int.self, forKey: Images.CodingKeys.displayOrder)
        self.images = try container.decodeIfPresent([Images].self, forKey: Images.CodingKeys.images)
        
    }
}

