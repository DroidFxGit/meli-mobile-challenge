//
//  MainViewController.swift
//  MercadoLibre
//
//  Created by Carlos Vazquez on 20/01/22.
//

import UIKit

class MainViewController: UIViewController {
    private let mainView = MainView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func loadView() {
        super.loadView()
        view = mainView
    }
}
