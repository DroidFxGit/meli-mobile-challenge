//
//  ProductDetailResponse.swift
//  MercadoLibre
//
//  Created by Carlos Vazquez on 24/01/22.
//

import Foundation

struct ProductDetailResponse: Codable {
    let id: String
    let name: String
    let pictures: [Picture]
    let features: [Feature]
    let description: Description
    let price: Price
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case pictures
        case features = "main_features"
        case description = "short_description"
        case price = "buy_box_winner"
    }
}

struct Price: Codable {
    let price: Double
    let currency: String
    
    enum CodingKeys: String, CodingKey {
        case price
        case currency = "currency_id"
    }
}

struct Picture: Codable {
    let url: String
}

struct Feature: Codable {
    let text: String
}

struct Description: Codable {
    let type: DescriptionType
    let content: String
}

enum DescriptionType: String, Codable {
    case plaintext
}
