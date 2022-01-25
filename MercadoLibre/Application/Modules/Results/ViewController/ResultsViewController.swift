//
//  ResultsViewController.swift
//  MercadoLibre
//
//  Created by Carlos Vazquez on 20/01/22.
//

import UIKit

class ResultsViewController: UIViewController {
    private let resultsView = ResultsView()
    private let viewModel: ResultsViewModel
    var products: [Product] = [] {
        didSet {
            resultsView.tableView.reloadData()
        }
    }
    var onSelectProduct: ((ProductDetailResponse) -> Void)?
    
    init(viewModel: ResultsViewModel,
         _ onSelectProduct: ((ProductDetailResponse) -> Void)? = nil) {
        self.viewModel = viewModel
        self.onSelectProduct = onSelectProduct
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        NotificationCenter.default.addObserver(self,
                                               selector:
                                                #selector(keyboardWillShow(notification:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide(notification:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
        configureTableView()
        bindDetail()
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
    
    func bindDetail() {
        viewModel.onFinishDetail = { [weak self] item in
            self?.onSelectProduct?(item)
        }
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            resultsView.tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
    }

    @objc private func keyboardWillHide(notification: NSNotification) {
        resultsView.tableView.contentInset = .zero
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
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = product.title
        cell.imageView?.image = UIImage(systemName: "magnifyingglass")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let product = products[indexPath.row]
        if let productId = product.productId {
            viewModel.checkDetail(id: productId)
        } else {
            let product = products[indexPath.row]
            onSelectProduct?(.init(id: product.id,
                                   name: product.title,
                                   pictures: [.init(url: product.thumbnail)],
                                   features: [.init(text: "")],
                                   description: .init(type: .plaintext, content: "")))
        }
        
    }
}
