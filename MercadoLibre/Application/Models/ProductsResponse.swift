//
//  ProductsResponse.swift
//  MercadoLibre
// //  Created by Carlos Vazquez on 20/01/22.
//

import Foundation

struct ProductsResponse: Codable {
    let results: [Product]
}

struct Product: Codable {
    let productId: String?
    let id: String
    let title: String
    let price: Double
    let currency: String
    let permalink: String
    let thumbnail: String
    
    enum CodingKeys: String, CodingKey {
        case productId = "catalog_product_id"
        case id
        case title
        case price
        case currency = "currency_id"
        case permalink
        case thumbnail
    }
}
