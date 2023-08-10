//
//  UrlModel.swift
//  ProductList
//
//  Created by Cevher Şirin on 10.08.2023.
//

struct UrlModel: Decodable {
    
    var url: String?
    var displayName: String?
    
    enum CodingKeys: String, CodingKey {
        case url = "Url"
        case displayName = "DisplayName"
    }
    
    init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<UrlModel.CodingKeys> = try decoder.container(keyedBy: UrlModel.CodingKeys.self)
        
        self.url = try container.decodeIfPresent(String.self, forKey: UrlModel.CodingKeys.url)
        self.displayName = try container.decodeIfPresent(String.self, forKey: UrlModel.CodingKeys.displayName)
        
    }
}

