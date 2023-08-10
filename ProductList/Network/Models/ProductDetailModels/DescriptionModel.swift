//
//  DescriptionModel.swift
//  ProductList
//
//  Created by Cevher Şirin on 10.08.2023.
//

struct Description: Decodable {
    
    var ozellikler: String?
    var urunKodu: String?
    
    enum CodingKeys: String, CodingKey {
        case ozellikler = "Özellikler"
        case urunKodu = "ÜrünKodu"
    }
    
    init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<Description.CodingKeys> = try decoder.container(keyedBy: Description.CodingKeys.self)
        
        self.ozellikler = try container.decodeIfPresent(String.self, forKey: Description.CodingKeys.ozellikler)
        self.urunKodu = try container.decodeIfPresent(String.self, forKey: Description.CodingKeys.urunKodu)
        
    }
}
