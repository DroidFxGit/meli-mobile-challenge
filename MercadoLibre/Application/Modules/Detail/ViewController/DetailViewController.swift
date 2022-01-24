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
        detailView.collectionView.delegate = datasource
        detailView.collectionView.dataSource = datasource
    }
    
    override func loadView() {
        super.loadView()
        view = detailView
    }
}
