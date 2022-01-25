//
//  ImageLoader.swift
//  MercadoLibre
//1
//  Created by Carlos Vazquez on 22/01/22.
//

import UIKit
import Combine

struct ImageLoader {
    static var subscriptions = Set<AnyCancellable>()
    static func load(from string: String, completion: @escaping ((UIImage) -> Void)) {
        let url = URL(string: string)
        url.publisher
            .receive(on: DispatchQueue.main)
            .flatMap { URLSession.shared.dataTaskPublisher(for: $0) }
            .compactMap { $0.data }
            .compactMap { UIImage(data: $0) }
            .sink(receiveCompletion: ( { state in
            })) { output in
                completion(output)
            }
            .store(in: &subscriptions)
    }
}
