//
//  ResultsViewController.swift
//  MercadoLibre
//
//  Created by Carlos Vazquez on 20/01/22.
//

import UIKit

class ResultsViewController: UIViewController {
    private let resultsView = ResultsView()
    var products: [Product] = [] {
        didSet {
            resultsView.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureTableView()
    }
    
    override func loadView() {
        super.loadView()
        view = resultsView
    }
    
    func configureTableView() {
        resultsView.tableView.delegate = self
        resultsView.tableView.dataSource = self
        resultsView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "resultsIndentifier")
    }
}

extension ResultsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "resultsIndentifier") else {
            preconditionFailure("cannot dequeue cell")
        }
        let product = products[indexPath.row]
        cell.textLabel?.text = product.title
        cell.imageView?.image = UIImage(systemName: "magnifyingglass")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
