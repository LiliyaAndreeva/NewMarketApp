//  Created by Motherlode Team on 29.10.23.

import UIKit

final class ProductsTableViewController: UIViewController {
    var products: [Product]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Styles.beige
        
//        tableView.register(CustomProductTableViewCell.self, forCellReuseIdentifier: "secondCell")

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let descriptionVC = segue.destination as? ProductsDescriptionViewController
//        let selectedProduct = products[indexPath.row]
//        descriptionVC?.product = selectedProduct
    }
}

extension ProductsTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "secondCell") as! CustomProductTableViewCell
        var content = cell.defaultContentConfiguration()
        let product = products[indexPath.row]
        
        cell.priceLabel.text = "\(product.price) ₽"
        cell.productLabel.text = product.productName
        cell.imageView?.image = UIImage(named: product.imageName)

        return cell
    }

}

extension ProductsTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let tableViewWidth = tableView.bounds.width
        let cellWidth = tableViewWidth * 0.15 // ячейка будет занимать % ширины таблицы
        return cellWidth
    }
    
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "secondCell") as? CustomProductTableViewCell
//        let product = products[section]
//        cell?.productLabel.text = product.productName
////        cell?.priceLabel.text = "\(product.price) ₽"
//        
//    
//        return cell
//    }
}

