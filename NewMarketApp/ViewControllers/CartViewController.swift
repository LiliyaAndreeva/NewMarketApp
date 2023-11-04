//
//  CartViewController.swift
//  NewMarketApp
//
//  Created by Лилия Андреева on 29.10.2023.
//

import UIKit

class CartViewController: UIViewController {
    
    var products: [Product] = []
    var productsByName: [String: Product] = [:]
    var countInCart = 0
    
    var user: User!
    
    @IBOutlet weak var mainTable: UITableView!
    @IBOutlet weak var bottomOrder: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Styles.secondaryBrown
        bottomOrder.backgroundColor = Styles.primaryBrown
        bottomOrder.clipsToBounds = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let porderVC = segue.destination as? OrderViewController else { return }
        porderVC.user = user
    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // При возвращении на этот экран
        products = Basket.shared.cartProducts
        mainTable.reloadData()
        
        for item in products {
            if productsByName[item.productName] != nil {
                countInCart += 1
            } else {
                productsByName[item.productName] = item
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        bottomOrder.layer.cornerRadius = bottomOrder.bounds.height / 2
    }
}
    
// MARK: - UITableViewDataSourse
extension CartViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        productsByName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as? CartViewCell else { return UITableViewCell() }
       
        let uniqProducts = Array(productsByName.values)
        let product = uniqProducts[indexPath.row]
                
        cell.productLabel.text = product.productName
        cell.imageView?.image = UIImage(named: product.imageName)
        cell.priceLabel.text = String(product.price)
        cell.productQuantityTF.text = String(countInCart)
        return cell
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}

// MARK: - UITableViewDelegate
extension CartViewController{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - UITextFieldDelegate
extension CartViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    } //убирает клавиатуру
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else {
            showAlert(withTitle: "Wrong format!", andMessage: "Please enter correct value")
            return
        }
        
        guard let currentValue = Int(text)  else {
            showAlert(
                withTitle: "Wrong format!",
                andMessage: "Please enter correct value",
                textField: textField
            )
            return
        }
    }
    
    private func showAlert(withTitle title: String, andMessage message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = "1"
            textField?.becomeFirstResponder()
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

