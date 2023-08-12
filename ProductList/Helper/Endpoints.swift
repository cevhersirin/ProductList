//
//  Endpoints.swift
//  ProductList
//
//  Created by Cevher Şirin on 10.08.2023.
//

class Endpoints {
    
    static let shared = Endpoints()
    
    let listUrl = "https://www.beymen.com/Mobile2/api/mbproduct/list?siralama=akillisiralama&sayfa=1&categoryId=10020&includeDocuments=true"
    let detailUrl = "https://www.beymen.com/Mobile2/api/mbproduct/product?productid="
    
    func getDetailUrl(productId: String) -> String {
        return "https://www.beymen.com/Mobile2/api/mbproduct/product?productid=\(productId)"
    }
    
    func getListUrl(page: Int) -> String {
        return "https://www.beymen.com/Mobile2/api/mbproduct/list?siralama=akillisiralama&sayfa=\(page)&categoryId=10020&includeDocuments=true"
    }
}
