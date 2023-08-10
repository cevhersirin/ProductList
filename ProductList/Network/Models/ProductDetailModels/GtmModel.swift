//
//  GtmModel.swift
//  ProductList
//
//  Created by Cevher Şirin on 10.08.2023.
//

struct GtmModel: Decodable {
    
    var pseas: String?
    var pgen: String?
    var pdsct: String?
    var pother: String?
    var pmaingroup: String?
    var pproductgroup: String?
    var pconsignment: String?
    
    enum CodingKeys: String, CodingKey {
        case pseas = "Pseas"
        case pgen = "Pgen"
        case pdsct = "Pdsct"
        case pother = "Pother"
        case pmaingroup = "Pmaingroup"
        case pproductgroup = "Pproductgroup"
        case pconsignment = "Pconsignment"
    }
    
    init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<GtmModel.CodingKeys> = try decoder.container(keyedBy: GtmModel.CodingKeys.self)
        
        self.pseas = try container.decodeIfPresent(String.self, forKey: GtmModel.CodingKeys.pseas)
        self.pgen = try container.decodeIfPresent(String.self, forKey: GtmModel.CodingKeys.pgen)
        self.pdsct = try container.decodeIfPresent(String.self, forKey: GtmModel.CodingKeys.pdsct)
        self.pother = try container.decodeIfPresent(String.self, forKey: GtmModel.CodingKeys.pother)
        self.pmaingroup = try container.decodeIfPresent(String.self, forKey: GtmModel.CodingKeys.pmaingroup)
        self.pproductgroup = try container.decodeIfPresent(String.self, forKey: GtmModel.CodingKeys.pproductgroup)
        self.pconsignment = try container.decodeIfPresent(String.self, forKey: GtmModel.CodingKeys.pconsignment)
        
    }
    
}

