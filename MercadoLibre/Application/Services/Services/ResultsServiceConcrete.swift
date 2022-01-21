//
//  ResultsServiceConcrete.swift
//  MercadoLibre
//
//  Created by Carlos Vazquez on 20/01/22.
//

import Foundation
import Combine

protocol ResultsService: AnyObject {
    func fetchResults(text: String) -> AnyPublisher<ProductsResponse, ServiceError>
}

final class ResultsServiceConcrete: ResultsService {
    private let service: BaseService
    
    init(service: BaseService = BaseService()) {
        self.service = service
    }
    
    func fetchResults(text: String) -> AnyPublisher<ProductsResponse, ServiceError> {
        guard let request = try? ResultsServiceRouter.fetchResults(text: text).asURLRequest() else {
            let error = ServiceError.network(description: "Couldn't create URLRequest")
            return Fail(error: error).eraseToAnyPublisher()
        }
        return service.perform(request: request)
    }
}
