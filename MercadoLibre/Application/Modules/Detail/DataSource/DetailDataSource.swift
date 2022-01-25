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
    var onUpdatePager: ((UIScrollView) -> Void)?
    
    init(item: ProductDetailResponse) {
        self.item = item
        super.init()
    }
    
    func numberOfPages() -> Int {
        return item.pictures.count
    }
}

extension DetailDataSource: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return item.pictures.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailCollectionViewCell.identifier,
                                                            for: indexPath) as? DetailCollectionViewCell else {
            preconditionFailure("coudn't load cell")
        }
        ImageLoader.load(from: item.pictures[indexPath.row].url) { image in
            DispatchQueue.main.async {
                cell.configure(image: image)
            }
        }
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        onUpdatePager?(scrollView)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        onUpdatePager?(scrollView)
    }
}

extension DetailDataSource: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout
                        collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.frame.size
        return CGSize(width: size.width, height: size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}
