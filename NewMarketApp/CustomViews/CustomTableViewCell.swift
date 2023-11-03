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
    
    @IBOutlet weak var priceOfProductLabel: UILabel!
    
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    
    @IBOutlet weak var productQuantityTF: UITextField!
    
    
    //private var count = Int(productQuantityTF ?? 1)
    private var count = 1
    private var price = 100
    private var summa = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        priceLabel.text = "\(price)"
        priceOfProductLabel.text = priceLabel.text
        setupTF()
        checkInTF()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func minusPlusButtonPressed(_ sender: UIButton) {
        
        switch sender {
        case minusButton:
            if count > 0 {
                count -= 1
            }
            checkInTF()
            
        default:
            count += 1
            checkInTF()
        }
       productQuantityTF.text = "\(count)"
    }
}

// MARK: - extensions
extension CustomTableViewCell {
    
    private func checkInTF(){
        summa = price * count
        priceOfProductLabel.text = "\(summa)"
    }
}



// MARK: - UITextFieldDelegate
extension CustomTableViewCell: UITextFieldDelegate {
    
    private func setupTF() {
        productQuantityTF.delegate = self
        productQuantityTF.endEditing(true)
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if (0..<999).contains(Float(textField.text ?? "") ?? 0) {
  
            count = Int(textField.text ?? "") ?? 1
            checkInTF()
        }
    }
}
