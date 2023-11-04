//
//  CartViewController.swift
//  NewMarketApp
//
//  Created by Лилия Андреева on 29.10.2023.
//

import UIKit

class CartViewController: UIViewController {
    
    var products: [Product] = []
    var productsCount: [Product: Int] = [:]
    var countInCart = 0
    
    var user: User!
    
    @IBOutlet weak var mainTable: UITableView!
    @IBOutlet weak var bottomOrder: UIButton!
    
    @IBOutlet weak var totalSumLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Styles.secondaryBrown
        bottomOrder.backgroundColor = Styles.primaryBrown
        bottomOrder.clipsToBounds = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let orderVC = segue.destination as? OrderViewController else { return }
        orderVC.user = user
    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // При возвращении на этот экран
        products = Basket.shared.cartProducts
        productsCount.removeAll()
        
        // Создание словаря Продукт - количество
        for product in products {
            if let productCount = productsCount[product] {
                productsCount.updateValue(productCount + 1, forKey: product)
            } else {
                productsCount[product] = 1
            }
        }
        mainTable.reloadData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        bottomOrder.layer.cornerRadius = bottomOrder.bounds.height / 2
    }
}
    
// MARK: - UITableViewDataSourse
extension CartViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        productsCount.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as? CartViewCell else { return UITableViewCell() }
       
        let uniqProducts = productsCount.map{ $0.key }
        let product = uniqProducts[indexPath.row]
        
        cell.productLabel.text = product.productName
        cell.priceLabel.text = "\(product.price) ₽"
        let productPrice = product.price * Double(productsCount[product] ?? 0)
        cell.priceOfProductLabel.text = String(format: "%.2f", productPrice) + " ₽"

        cell.productQuantityTF.text = String(productsCount[product] ?? 0)
        cell.imageView?.image = UIImage(named: product.imageName)
        
        cell.contentView.backgroundColor = view.backgroundColor
        
        return cell
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}

// MARK: - UITableViewDelegate
extension CartViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let tableViewWidth = tableView.bounds.width
        let cellWidth = tableViewWidth * 0.15 // ячейка будет занимать % ширины таблицы
        return cellWidth
    }

}

// MARK: - UITextFieldDelegate
extension CartViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    } //убирает клавиатуру
    
    
}

