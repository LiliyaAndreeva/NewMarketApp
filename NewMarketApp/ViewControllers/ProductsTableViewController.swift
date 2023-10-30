//
//  ProductListTableViewController.swift
//  NewMarketApp
//
//  Created by Лилия Андреева on 29.10.2023.
//

import UIKit

class ProductsTableViewController: UITableViewController {

    var products: [Product]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor  = Styles.secondaryBrown
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let descriptionVC = segue.destination as? ProductsDescriptionViewController
        let selectedProduct = products[indexPath.row]
        descriptionVC?.product = selectedProduct
    }
    
}

// MARK: - Table view data source

extension ProductsTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        products.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "secondCell", for: indexPath)
        let product = products[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = product.name
        content.secondaryText = String(product.price)
        cell.contentConfiguration = content
        // Configure the cell...

        return cell
    }
    
}
