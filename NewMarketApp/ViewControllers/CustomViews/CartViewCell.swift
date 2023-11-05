//  Created by Motherlode Team on 29.10.23.

import UIKit

protocol CartCellDelegate {
    func getTotalSum(_ cell: CartViewCell)
}

final class CartViewCell: UITableViewCell {
    var product: Product!
    var finaResult = 0.0
    var cartTable: UITableView!
    
    @IBOutlet weak var productLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var totalOneProductsPriceLabel: UILabel!
    
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!

    @IBOutlet weak var productQuantityTF: UITextField!
    
    private var productsCount = [Product: Int]()
    private var count = 1
    private var sum = 0.0
    
    var delegate: CartCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        totalOneProductsPriceLabel.text = priceLabel.text
        setupTF()
        calculateАmount()
        delegate?.getTotalSum(self)
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
            Basket.shared.intermediaryArray.append(product)
        default:
            count += 1
            if let index = Basket.shared.intermediaryArray.firstIndex(where: { $0.productId == product.productId }) {
                Basket.shared.intermediaryArray.remove(at: index)
            }
        }
        calculateАmount()
        print(finaResult)
    }
}

// MARK: - extensions
extension CartViewCell {
    
    private func calculateАmount(){
      
        getDictionaryProductsCount()
        totalOneProductsPriceLabel.text = String(format: "%.2f", sum) + " ₽"
        productQuantityTF.text = "\(count)"
    }
    
    private func getDictionaryProductsCount(){
        
        // Создание словаря Продукт - количество
        for product in Basket.shared.cartProducts {
            if let productCount = productsCount[product] {
                productsCount.updateValue(productCount + 1, forKey: product)
                sum = product.price * Double(count)
            } else {
                productsCount[product] = 1
            }
        }
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
