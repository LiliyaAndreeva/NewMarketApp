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
            checkInTF()
            
        default:
            count += 1
            checkInTF()
        }
        
        productQuantityTF.text = "\(count)"
    }
    
    func checkInTF(){
        summa = price * count
        priceOfProductTF.text = "\(summa)"
    }
}

extension CustomTableViewCell {
    private func showAlert(withTitle title: String, andMessage message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = "1"
            textField?.becomeFirstResponder()
        }
        alert.addAction(okAction)
        //present(alert, animated: true)
    }
}



// MARK: - UITextFieldDelegate
extension CustomTableViewCell: UITextFieldDelegate {
    
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
        
//        productQuantityTF.text = mutableSetValue(forKey: productQuantityTF)
        
        
        
        
    }
    
}
