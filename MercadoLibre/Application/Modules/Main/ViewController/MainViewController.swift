//
//  MainViewController.swift
//  MercadoLibre
//
//  Created by Carlos Vazquez on 20/01/22.
//

import UIKit

class MainViewController: UIViewController {
    private let mainView = MainView()
    private var viewModel: MainViewModel
    private var searchController: UISearchController
    
    init(viewModel: MainViewModel,
         searchController: UISearchController) {
        self.viewModel = viewModel
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
        handleBindings()
    }
    
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    func setupView() {
        view.backgroundColor = .white
        configureSearchController()
    }
    
    func handleBindings() {
        viewModel.onChangeResults = { [weak self] res in
            guard let resultsView = self?.searchController.searchResultsController as? ResultsViewController else {
                return
            }
            resultsView.products = res.results
        }
    }
    
    func configureSearchController() {
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
    }
}

extension MainViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        viewModel.fetchResults(text: text)
    }
}
