//
//  MainCoordinator.swift
//  MercadoLibre
//
//  Created by Carlos Vazquez on 20/01/22.
//

import Foundation
import UIKit

protocol Startable: AnyObject {
    func start() -> Void
}

final class MainCoordinator: Startable {
    private weak var window: UIWindow?
    lazy var rootController: UINavigationController = UINavigationController()
    lazy var service: ResultsService = ResultsServiceConcrete()
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        configureMainView()
        window?.rootViewController = rootController
        window?.makeKeyAndVisible()
    }
    
    func configureMainView() {
        let viewModel = MainViewModel(service: service)
        let mainView = MainViewController(viewModel: viewModel, searchController: searchController())
        rootController.viewControllers = [mainView]
        rootController.navigationBar.prefersLargeTitles = true
    }
    
    func searchController() -> UISearchController {
        let viewModel = ResultsViewModel(service: service)
        let resulstView = ResultsViewController(viewModel: viewModel) { [weak self] item in
            self?.configureDetailView(item: item)
        }
        let searchController = UISearchController(searchResultsController: resulstView)
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = NSLocalizedString("SEARCH_PLACEHOLDER", comment: "")
        return searchController
    }
    
    func configureDetailView(item: ProductDetailResponse) {
        let detailView = DetailViewController(item: item)
        detailView.headerView = headerView(item: item)
        let navigationController = UINavigationController(rootViewController: detailView)
        rootController.present(navigationController, animated: true)
    }
    
    func headerView(item: ProductDetailResponse) -> UIViewController {
        let datasource = DetailDataSource(item: item)
        let headerView = HeaderViewController(datasource: datasource)
        return headerView
    }
}
