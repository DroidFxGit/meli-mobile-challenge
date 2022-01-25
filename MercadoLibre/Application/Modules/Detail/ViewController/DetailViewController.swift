//
//  DetailContainerViewController.swift
//  MercadoLibre
//
//  Created by Carlos Vazquez on 24/01/22.
//

import UIKit

final class DetailViewController: UIViewController {
    var headerView: HeaderViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
