//
//  ContentUrlModel.swift
//  ProductList
//
//  Created by Cevher Şirin on 10.08.2023.
//

struct ContentUrl: Decodable {
    
    var delivery: String?
    var shipment: String?
    var oneCard: String?
    var sizeChartUrl: String?
    var shipmentAndDelivery: String?
    var preOwnedStatus: String?
    
    enum CodingKeys: String, CodingKey {
        case delivery = "Delivery"
        case shipment = "Shipment"
        case oneCard = "OneCard"
        case sizeChartUrl = "SizeChartUrl"
        case shipmentAndDelivery = "ShipmentAndDelivery"
        case preOwnedStatus = "PreOwnedStatus"
    }
    
    init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<ContentUrl.CodingKeys> = try decoder.container(keyedBy: ContentUrl.CodingKeys.self)
        
        self.delivery = try container.decodeIfPresent(String.self, forKey: ContentUrl.CodingKeys.delivery)
        self.shipment = try container.decodeIfPresent(String.self, forKey: ContentUrl.CodingKeys.shipment)
        self.oneCard = try container.decodeIfPresent(String.self, forKey: ContentUrl.CodingKeys.oneCard)
        self.sizeChartUrl = try container.decodeIfPresent(String.self, forKey: ContentUrl.CodingKeys.sizeChartUrl)
        self.shipmentAndDelivery = try container.decodeIfPresent(String.self, forKey: ContentUrl.CodingKeys.shipmentAndDelivery)
        self.preOwnedStatus = try container.decodeIfPresent(String.self, forKey: ContentUrl.CodingKeys.preOwnedStatus)
        
    }
}

