//
//  DetailDataSource.swift
//  MercadoLibre
//
//  Created by Carlos Vazquez on 24/01/22.
//

import Foundation
import UIKit

final class DetailDataSource: NSObject {
    private let item: ProductDetailResponse
    
    init(item: ProductDetailResponse) {
        self.item = item
        super.init()
    }
}

extension DetailDataSource: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return item.pictures.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}
