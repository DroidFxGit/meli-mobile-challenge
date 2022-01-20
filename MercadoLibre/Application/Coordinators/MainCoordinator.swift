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
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        configureMainView()
        window?.rootViewController = rootController
        window?.makeKeyAndVisible()
    }
    
    func configureMainView() {
        let mainView = MainViewController()
        rootController.viewControllers = [mainView]
        rootController.navigationBar.prefersLargeTitles = true
    }
}
