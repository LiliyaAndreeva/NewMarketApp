//
//  CartViewController.swift
//  NewMarketApp
//
//  Created by Лилия Андреева on 29.10.2023.
//

import UIKit

class CartViewController: UIViewController {
    
    var products: [Product] = []
    var user: User!
    
    private var productsInCart = ["Хлеб", "Молоко", "Яйца", "Торт", "Курица", "Гречка", "Рис"]
    private var price = ["100", "200", "150", "250", "300", "500", "700"]
    
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
        if let selectedProduct = Musorka.shared.selectedProduct {
            products.append(selectedProduct)
            Musorka.shared.selectedProduct = nil
            mainTable.reloadData()
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
        productsInCart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomTableViewCell /*else { return UITableViewCell() }*/
        
        //let product = productsInCart[indexPath.row]
        //let price = price[indexPath.row]
        cell.productLabel.text = productsInCart[indexPath.row]
        // cell.priceLabel.text = price[ind]
        //cell.imageView?.image = UIImage(named: user.)
        //
        //        return cell
        
        //content.secondaryText = productsInCart. здесь цена?
        //        content.image = UIImage(named: track.title) для картинки имена из модели
        //        content.imageProperties.cornerRadius = tableView.rowHeight / 2
        //
        //        cell.contentConfiguration = content
        
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
        guard let currentValue = Float(text), (1...100).contains(currentValue) else {
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

