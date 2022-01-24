//
//  ResultsViewModel.swift
//  MercadoLibre
//
//  Created by Carlos Vazquez on 24/01/22.
//

import Foundation
import Combine

final class ResultsViewModel {
    private let service: ResultsService
    private var disposables = Set<AnyCancellable>()
    private(set) var item: ProductDetailResponse! {
        didSet {
            onFinishDetail?(item)
        }
    }
    var onFinishDetail: ((ProductDetailResponse) -> Void)?
    
    init(service: ResultsService) {
        self.service = service
    }
    
    func checkDetail(id: String) {
        service.detail(id: id)
            .receive(on: DispatchQueue.main)
            .sink { _ in
            } receiveValue: { response in
                self.item = response
            }
            .store(in: &disposables)
    }
}
