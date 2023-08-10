//
//  BaseResponse.swift
//  ProductList
//
//  Created by Cevher Şirin on 10.08.2023.
//

struct BaseResponse<T: Decodable>: Decodable {
    
    public let success: Bool?
    public let message: String?
    public let result: T?
    public let exception: String?
    public let isOriginFromCheckout: Bool?
    
    enum CodingKeys: String, CodingKey {
        case success = "Success"
        case message = "Message"
        case result = "Result"
        case exception = "Exception"
        case isOriginFromCheckout = "IsOriginFromCheckout"
    }
    
    init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<BaseResponse<T>.CodingKeys> = try decoder.container(keyedBy: BaseResponse<T>.CodingKeys.self)
        
        self.success = try container.decodeIfPresent(Bool.self, forKey: BaseResponse<T>.CodingKeys.success)
        self.message = try container.decodeIfPresent(String.self, forKey: BaseResponse<T>.CodingKeys.message)
        self.result = try container.decodeIfPresent(T.self, forKey: BaseResponse<T>.CodingKeys.result)
        self.exception = try container.decodeIfPresent(String.self, forKey: BaseResponse<T>.CodingKeys.exception)
        self.isOriginFromCheckout = try container.decodeIfPresent(Bool.self, forKey: BaseResponse<T>.CodingKeys.isOriginFromCheckout)
        
    }
}
