//
//  MainViewController.swift
//  MercadoLibre
//
//  Created by Carlos Vazquez on 20/01/22.
//

import UIKit

class MainViewController: UIViewController {
    private let mainView = MainView()
    private var searchController: UISearchController
    
    init(searchController: UISearchController) {
        self.searchController = searchController
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    func setupView() {
        view.backgroundColor = .white
        configureSearchController()
    }
}

private extension MainViewController {
    func configureSearchController() {
//        searchController.searchResultsUpdater = datasource
        navigationItem.searchController = searchController
    }
}
