//
//  DetailViewController.swift
//  MercadoLibre
//
//  Created by Carlos Vazquez on 23/01/22.
//

import UIKit

class DetailViewController: UIViewController {
    private let detailView = DetailView()
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
        view = detailView
    }
    
    func configureUI() {
        view.backgroundColor = .background
        detailView.pageControl.numberOfPages = datasource.numberOfPages()
        detailView.pageControl.currentPage = 0
        detailView.collectionView.register(DetailCollectionViewCell.self,
                                           forCellWithReuseIdentifier: DetailCollectionViewCell.identifier)
        detailView.collectionView.delegate = datasource
        detailView.collectionView.dataSource = datasource
    }
    
    func updatePager(scrollView: UIScrollView) {
        let pageIndex = Int(round(scrollView.contentOffset.x / view.frame.width))
        detailView.pageControl.currentPage = pageIndex
    }
}
