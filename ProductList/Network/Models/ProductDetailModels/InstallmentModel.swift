//
//  InstallmentModel.swift
//  ProductList
//
//  Created by Cevher Şirin on 10.08.2023.
//

struct Installment: Decodable {
    
    var installmentWarningText: String?
    var hasInstallmentWarning: Bool?
    var url: String?
    var installmentCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case installmentWarningText = "InstallmentWarningText"
        case hasInstallmentWarning = "HasInstallmentWarning"
        case url = "Url"
        case installmentCount = "InstallmentCount"
    }
    
    init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<Installment.CodingKeys> = try decoder.container(keyedBy: Installment.CodingKeys.self)
        
        self.installmentWarningText = try container.decodeIfPresent(String.self, forKey: Installment.CodingKeys.installmentWarningText)
        self.hasInstallmentWarning = try container.decodeIfPresent(Bool.self, forKey: Installment.CodingKeys.hasInstallmentWarning)
        self.url = try container.decodeIfPresent(String.self, forKey: Installment.CodingKeys.url)
        self.installmentCount = try container.decodeIfPresent(Int.self, forKey: Installment.CodingKeys.installmentCount)
        
    }
}

