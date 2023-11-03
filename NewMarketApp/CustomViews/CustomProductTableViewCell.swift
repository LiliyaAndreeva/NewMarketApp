//
//  CustomProductTableViewCell.swift
//  NewMarketApp
//
//  Created by Admin on 31/10/2023.
//

import UIKit

final class CustomProductTableViewCell: UITableViewCell {
    var product: Product!
    var cart = [Product?]()
    var products = [Product?]()
    
    @IBOutlet weak var numberOfProductsTF: UITextField!
    @IBOutlet weak var productImage: UIImageView!
    
    @IBOutlet weak var productLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var increment: UIButton!
    @IBOutlet weak var decrement: UIButton!
    
    @IBOutlet weak var quantityTextField: UITextField!
        
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func addToCart() {

        print("add")
    }
    
    @IBAction func addRemoveProduct(_ sender: UIButton) {
        switch sender {
        case increment:
            Basket.shared.posrednik.append(product)
            Basket.shared.numberOfProductsInCart += 1
             numberOfProductsTF.text = String( Basket.shared.numberOfProductsInCart)
        default:
            if let index = Basket.shared.posrednik.firstIndex(where: { $0.productId == product.productId }) {
                Basket.shared.posrednik.remove(at: index)
                Basket.shared.numberOfProductsInCart -= 1
                numberOfProductsTF.text = String( Basket.shared.numberOfProductsInCart)
            }
        }
        
        print(Basket.shared.posrednik.count)
        
    }
    @IBAction func addToBasket(_ sender: Any) {
        Basket.shared.cartProducts = Basket.shared.posrednik
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
