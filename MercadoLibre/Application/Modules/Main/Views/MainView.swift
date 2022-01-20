//
//  MainView.swift
//  MercadoLibre
//
//  Created by Carlos Vazquez on 20/01/22.
//

import UIKit

final class MainView: UIView {
    private let activityIndicator = UIActivityIndicatorView()
    let tableView = UITableView()
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func disableActivityIndicator() {
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
    }
    
    func enableActivityIndicator() {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }
}

private extension MainView {
    func setup() {
        configureTableView()
        configureActivityIndicator()
        addSubViews()
        setupConstraints()
    }
    
    func configureTableView() {
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.rowHeight = 96
        tableView.backgroundColor = .systemBackground
    }
    
    func configureActivityIndicator() {
        activityIndicator.style = .large
    }
    
    func addSubViews() {
        addSubview(tableView)
        addSubview(activityIndicator)
    }
    
    func setupConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
