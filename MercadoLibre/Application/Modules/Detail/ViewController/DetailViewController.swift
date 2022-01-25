//
//  DetailContainerViewController.swift
//  MercadoLibre
//
//  Created by Carlos Vazquez on 24/01/22.
//

import UIKit

final class DetailViewController: UIViewController {
    var headerView: UIViewController?
    private let detailView = DetailView()
    private let item: ProductDetailResponse
    private let allSections = Sections.allCases
    private let identifier = "detailIndentifier"
    
    private lazy var doneButton: UIBarButtonItem = {
        let select = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneAction))
        select.tintColor = .text
        return select
    }()
    
    enum Sections: Int, CaseIterable {
        case title = 0
        case price
        case descriptionText
        case features
    }
    
    init(item: ProductDetailResponse) {
        self.item = item
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailView.tableView.delegate = self
        detailView.tableView.dataSource = self
        detailView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        navigationItem.rightBarButtonItem = doneButton
    }
    
    override func loadView() {
        super.loadView()
        view = detailView
    }
    
    @objc func doneAction() {
        dismiss(animated: true)
    }
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return allSections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = allSections[section]
        switch section {
        case .title, .descriptionText, .price:
            return 1
        case .features:
            return item.features.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier) else {
            preconditionFailure("cannot dequeue cell")
        }
        cell.textLabel?.numberOfLines = 0
        cell.selectionStyle = .none
        let section = allSections[indexPath.section]
        switch section {
        case .title:
            cell.textLabel?.text = item.name
            cell.textLabel?.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        case .price:
            let currency = NumberFormatter.localizedString(from: NSNumber(value: item.price.price), number: .currency)
            cell.textLabel?.text = "\(currency) \(item.price.currency)"
            cell.textLabel?.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        case .descriptionText:
            cell.textLabel?.text = item.description.content
            cell.textLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        case .features:
            let feature = item.features[indexPath.row]
            cell.textLabel?.text = feature.text
            cell.textLabel?.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return section == 0 ? headerView?.view : nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 300.0 : 0.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let section = allSections[indexPath.section]
        switch section {
        case .title, .features, .price:
            return 96
        case .descriptionText:
            return item.description.content.isEmpty ? 0.0 : 500.0
        }
    }
}
