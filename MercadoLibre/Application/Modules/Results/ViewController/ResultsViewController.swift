//
//  ResultsViewController.swift
//  MercadoLibre
//
//  Created by Carlos Vazquez on 20/01/22.
//

import UIKit

class ResultsViewController: UIViewController {
    private let resultsView = ResultsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        view = resultsView
    }
}
