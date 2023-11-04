//  Created by Motherlode Team on 29.10.23.

import UIKit

final class ProductsTableViewController: UITableViewController {
    
    
    
    var products: [Product]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Styles.beige
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let descriptionVC = segue.destination as? ProductsDescriptionViewController
        let selectedProduct = products[indexPath.row]
        descriptionVC?.product = selectedProduct
    }
    
    
    @IBAction func cartButtonPressed(_ sender: UIButton) {
        showAlert(
            title: "Товар успешно добавлен в корзину",
            message: "Вы можете перейти к оформлению заказа или продолжить покупки"
        )
    }
    
}

extension ProductsTableViewController {
    
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        products.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "secondCell") as? ProductViewCell else { return UITableViewCell() }

        let product = products[indexPath.row]
        
        cell.priceLabel.text = "\(product.price) ₽"
        cell.productLabel.text = product.productName
        cell.imageView?.image = UIImage(named: product.imageName)
        cell.contentView.backgroundColor = view.backgroundColor
        cell.product = product
        
        return cell
    }
}

extension ProductsTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let tableViewWidth = tableView.bounds.width
        let cellWidth = tableViewWidth * 0.15 // ячейка будет занимать % ширины таблицы
        return cellWidth
    }
}



