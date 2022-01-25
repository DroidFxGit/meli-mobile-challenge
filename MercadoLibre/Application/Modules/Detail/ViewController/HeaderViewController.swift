//
//  HeaderViewController.swift
//  MercadoLibre
//
//  Created by Carlos Vazquez on 23/01/22.
//

import UIKit

class HeaderViewController: UIViewController {
    private let headerView = HeaderView()
    private let datasource: DetailDataSource
    
    init(datasource: DetailDataSource) {
        self.datasource = datasource
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        datasource.onUpdatePager = { [weak self] scrollView in
            self?.updatePager(scrollView: scrollView)
        }
    }
    
    override func loadView() {
        super.loadView()
        view = headerView
    }
    
    func configureUI() {
        view.backgroundColor = .background
        headerView.pageControl.numberOfPages = datasource.numberOfPages()
        headerView.pageControl.currentPage = 0
        headerView.collectionView.register(DetailCollectionViewCell.self,
                                           forCellWithReuseIdentifier: DetailCollectionViewCell.identifier)
        headerView.collectionView.delegate = datasource
        headerView.collectionView.dataSource = datasource
    }
    
    func updatePager(scrollView: UIScrollView) {
        let pageIndex = Int(round(scrollView.contentOffset.x / view.frame.width))
        headerView.pageControl.currentPage = pageIndex
    }
}
