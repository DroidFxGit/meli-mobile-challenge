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
    let id: String
    let title: String
    let price: Double
    let permalink: String
    let thumbnail: String
}
