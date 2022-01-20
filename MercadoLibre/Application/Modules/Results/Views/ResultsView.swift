//
//  ResultsView.swift
//  MercadoLibre
//
//  Created by Carlos Vazquez on 20/01/22.
//

import UIKit

final class ResultsView: UIView {
    private let tableView = UITableView()
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension ResultsView {
    func setup() {
        configureTableView()
        addSubview(tableView)
        setupConstraints()
    }
    
    func configureTableView() {
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = .systemBackground
    }
    
    func setupConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
