//
//  CustomProductTableViewCell.swift
//  NewMarketApp
//
//  Created by Admin on 31/10/2023.
//7

import UIKit

final class ProductViewCell: UITableViewCell {
    var product: Product!
    
    private var count = 0
    
    @IBOutlet weak var productsNumberTF: UITextField!
    @IBOutlet weak var productImage: UIImageView!
    
    @IBOutlet weak var productLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var increment: UIButton!
    @IBOutlet weak var decrement: UIButton!
    
    @IBOutlet weak var quantityTextField: UITextField!
        
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func addOrRemoveProductFromCart() {
        Basket.shared.cartProducts = Basket.shared.intermediaryArray
//        
//        showAlert(
//            withTitle: "Wrong format!",
//            andMessage: "Please enter correct value"
//        )
    }
    
    @IBAction func addRemoveProduct(_ sender: UIButton) {
        
        switch sender {
        case increment:
            count += 1
            Basket.shared.intermediaryArray.append(product)
            
        default:
            if count > 0 {
                count -= 1
            }
            if let index = Basket.shared.intermediaryArray.firstIndex(where: { $0.productId == product.productId }) {
                Basket.shared.intermediaryArray.remove(at: index)
            }
        }
        productsNumberTF.text = String(count)
    }
        
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
//extension ProductViewCell {
//   
//    private func showAlert(withTitle title: String, andMessage message: String) {
//        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
//        let okAction = UIAlertAction(title: "OK", style: .default) { _ in }
//        alert.addAction(okAction)
//        present(alert, animated: true)
//    }
//}
