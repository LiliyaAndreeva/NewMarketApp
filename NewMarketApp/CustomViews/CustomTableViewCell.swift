//
//  CustomTableViewCell.swift
//  NewMarketApp
//
//  Created by Лилия Андреева on 31.10.2023.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var productLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    
    @IBOutlet weak var productQuantityTF: UITextField!
    @IBOutlet weak var priceOfProductTF: UITextField!
    
    
    private var count = 1
    private var price = 100
    private var summa = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        priceLabel.text = "\(price)"
        
        priceOfProductTF.text = priceLabel.text
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func minusPlusButtonPressed(_ sender: UIButton) {
        
        
        switch sender {
        case minusButton:
            if count > 0 {
                count -= 1}
            summa = price * count
            priceOfProductTF.text = "\(summa)"
            
        default:
            count += 1

            summa = price * count
            priceOfProductTF.text = "\(summa)"
        }
        productQuantityTF.text = "\(count)"
    }
    

    

}
