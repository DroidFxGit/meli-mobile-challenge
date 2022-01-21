//
//  ResultsServiceRouter.swift
//  MercadoLibre
//
//  Created by Carlos Vazquez on 20/01/22.
//

import Foundation

enum ResultsServiceRouter: URLRequestConvertible {
    case fetchResults(text: String)
    
    var baseUrl: String {
        return "https://api.mercadolibre.com/sites/MLM"
    }
    
    var path: String {
        switch self {
        case .fetchResults:
            return "/search"
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .fetchResults(text: let text):
            return [
                "q": text,
                "status": "active",
                "limit": 15
            ]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        switch self {
        case .fetchResults:
            return request(baseURL: URL(string: baseUrl)!, path: path, method: .get, parameters: parameters)
        }
    }
}

private extension ResultsServiceRouter {
    func request(baseURL: URL, path: String, method: HTTPMethod, parameters: [String: Any]? = nil) -> URLRequest {
        var components = URLComponents(url: baseURL.appendingPathComponent(path), resolvingAgainstBaseURL: true)!
        components.queryItems = parameters?.map({ (key, value) -> URLQueryItem in
            return URLQueryItem(name: key, value: "\(value)")
        })
        
        var urlRequest = URLRequest(url: components.url!)
        urlRequest.httpMethod = method.rawValue
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        return urlRequest
    }
}
