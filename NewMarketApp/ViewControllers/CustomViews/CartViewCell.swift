//  Created by Motherlode Team on 29.10.23.

import UIKit

protocol CartCellDelegate {
    func productAmountChanged()
}

final class CartViewCell: UITableViewCell {
    var product: Product! {
        didSet { updateData() }
    }
    var finaResult = 0.0
    
    @IBOutlet weak var productLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var totalOneProductsPriceLabel: UILabel!
    
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!

    @IBOutlet weak var productQuantityTF: UITextField!
    
    var delegate: CartCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        totalOneProductsPriceLabel.text = priceLabel.text
        productQuantityTF.endEditing(true)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func minusPlusButtonPressed(_ sender: UIButton) {
        
        switch sender {
        case minusButton:
            if Basket.shared.cartInfo[product] != nil {
                Basket.shared.cartInfo[product, default: 1] -= 1
            } else {
                Basket.shared.cartInfo[product] = nil
            }
        default: // plus button
            Basket.shared.cartInfo[product, default: 0] += 1
        }
        updateData()
        delegate?.productAmountChanged()
        print(finaResult)
    }
}

// MARK: - extensions
extension CartViewCell {
    
    private func updateData() {
        let productCount = Basket.shared.cartInfo[product] ?? 0
        let sum = product.price * Double(productCount)
        totalOneProductsPriceLabel.text = String(format: "%.2f", sum) + " ₽"
        productQuantityTF.text = "\(productCount)"
    }

}
