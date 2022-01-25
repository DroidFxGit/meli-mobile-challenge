//
//  DetailView.swift
//  MercadoLibre
//
//  Created by Carlos Vazquez on 23/01/22.
//

import UIKit

class DetailView: UIView {
    private lazy var flowLayout: UICollectionViewFlowLayout = {
        let flow = UICollectionViewFlowLayout()
        flow.scrollDirection = .horizontal
        return flow
    }()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    let pageControl = UIPageControl()
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension DetailView {
    func setup() {
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.currentPageIndicatorTintColor = .primary
        collectionView.collectionViewLayout = flowLayout
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        addSubview(collectionView)
        addSubview(pageControl)
        setupCollectionViewConstraints()
        setupPageControlConstraints()
    }
    
    func setupCollectionViewConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    func setupPageControlConstraints() {
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pageControl.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 250),
            pageControl.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor)
        ])
    }
}
