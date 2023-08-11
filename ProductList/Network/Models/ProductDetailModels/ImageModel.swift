//
//  ImageModel.swift
//  ProductList
//
//  Created by Cevher Şirin on 11.08.2023.
//

struct Image: Decodable {
    
    var sizeCode: SizeCode?
    var imageUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case sizeCode = "SizeCode"
        case imageUrl = "ImageUrl"
    }
    
    init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<Image.CodingKeys> = try decoder.container(keyedBy: Image.CodingKeys.self)
        
        self.sizeCode = try container.decodeIfPresent(SizeCode.self, forKey: Image.CodingKeys.sizeCode)
        self.imageUrl = try container.decodeIfPresent(String.self, forKey: Image.CodingKeys.imageUrl)
        
    }
}

public enum SizeCode: String, Decodable {
    case cdnResize = "cdn-resize"
    case original = "original"
}
