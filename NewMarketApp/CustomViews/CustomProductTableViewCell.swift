//
//  CustomProductTableViewCell.swift
//  NewMarketApp
//
//  Created by Admin on 31/10/2023.
//

import UIKit

final class CustomProductTableViewCell: UITableViewCell {
    var products = [Product?]()
    
    @IBOutlet weak var productImage: UIImageView!
    
    @IBOutlet weak var productLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var increment: UIButton!
    @IBOutlet weak var decrement: UIButton!
    
    @IBOutlet weak var quantityTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        productImage.image = UIImage(named: "milk")
    }
}
