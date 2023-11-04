//
//  CustomTableViewCell.swift
//  NewMarketApp
//
//  Created by Лилия Андреева on 31.10.2023.
//

import UIKit

class CartViewCell: UITableViewCell {
    
    @IBOutlet weak var productLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var priceOfProductLabel: UILabel!
    
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    
    @IBOutlet weak var productQuantityTF: UITextField!
    
    private var count = 1
    private var price = 100
    private var sum = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        priceLabel.text = "\(price)"
        priceOfProductLabel.text = priceLabel.text
        setupTF()
        calculateАmount()
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
        default:
            count += 1
        }
        calculateАmount()
    }
}

// MARK: - extensions
extension CartViewCell {
    
    private func calculateАmount(){
        sum = price * count
        priceOfProductLabel.text = "\(sum)"
        productQuantityTF.text = "\(count)"
    }
}

// MARK: - UITextFieldDelegate
extension CartViewCell: UITextFieldDelegate {
    
    private func setupTF() {
        productQuantityTF.delegate = self
        productQuantityTF.endEditing(true)
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if (0..<999).contains(Float(textField.text ?? "") ?? 0) {
            
            count = Int(textField.text ?? "") ?? 1
            calculateАmount()
        }
    }
}
