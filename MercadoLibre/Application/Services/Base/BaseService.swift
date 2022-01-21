//
//  BaseService.swift
//  MercadoLibre
//
//  Created by Carlos Vazquez on 20/01/22.
//

import Foundation
import Combine

enum HTTPMethod: String {
    case post = "POST"
    case get = "GET"
    case delete = "DELETE"
}

enum ServiceError: Error {
  case parsing(description: String)
  case network(description: String)
}

class BaseService {
    
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func perform<T>(request: URLRequest) -> AnyPublisher<T, ServiceError> where T: Decodable {
        return session.dataTaskPublisher(for: request)
            .mapError { error in
                .network(description: error.localizedDescription)
            }
            .flatMap(maxPublishers: .max(1)) { output in
                self.decode(output.data)
            }
            .eraseToAnyPublisher()
    }
    
    private func decode<T: Decodable>(_ data: Data) -> AnyPublisher<T, ServiceError> {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        
        return Just(data)
            .decode(type: T.self, decoder: decoder)
            .mapError { error in
                .parsing(description: error.localizedDescription)
            }
            .eraseToAnyPublisher()
    }
}
