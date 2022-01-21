//
//  MainViewModel.swift
//  MercadoLibre
//
//  Created by Carlos Vazquez on 20/01/22.
//

import Foundation
import Combine

final class MainViewModel {
    private let service: ResultsService
    private var disposables = Set<AnyCancellable>()
    private(set) var results: ProductsResponse! {
        didSet {
            onChangeResults?(results)
        }
    }
    var onChangeResults: ((ProductsResponse) -> Void)?
    
    init(service: ResultsService) {
        self.service = service
    }
    
    func fetchResults(text: String) {
        service.fetchResults(text: text)
            .receive(on: DispatchQueue.main)
            .sink { _ in
            } receiveValue: { response in
                self.results = response
            }
            .store(in: &disposables)
    }
}
