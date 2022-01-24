//
//  DetailViewController.swift
//  MercadoLibre
//
//  Created by Carlos Vazquez on 23/01/22.
//

import UIKit

class DetailViewController: UIViewController {
    private let detailView = DetailView()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        view = detailView
    }
}
