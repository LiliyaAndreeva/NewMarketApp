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
    
    @IBOutlet weak var productImage: UIImageView!
    
    @IBOutlet weak var productLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var increment: UIButton!
    @IBOutlet weak var decrement: UIButton!
    
    @IBOutlet weak var quantityTextField: UITextField!
    
    weak var delegate: CustomProductTableViewCellDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func addToCart() {
//        delegate?.getChoosenProducts(product, buttonPressed: increment)
    }
    
    @IBAction func addRemoveProduct(_ sender: UIButton) {
        switch sender {
        case increment:
            products.append(product)
        default:
            products.removeFirst()
        }
        
        print(products.count)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
