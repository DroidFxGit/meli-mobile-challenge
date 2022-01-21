//
//  URLRequestConvertible.swift
//  MercadoLibre
//
//  Created by Carlos Vazquez on 20/01/22.
//

import Foundation

protocol URLRequestConvertible {
    func asURLRequest() throws -> URLRequest
}
