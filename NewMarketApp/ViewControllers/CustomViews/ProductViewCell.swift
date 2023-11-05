//  Created by Motherlode Team on 29.10.23.

import UIKit

final class ProductViewCell: UITableViewCell {
    var product: Product!
    
    @IBOutlet weak var productsNumberTF: UITextField!
    @IBOutlet weak var productImage: UIImageView!
    
    @IBOutlet weak var productLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var increment: UIButton!
    @IBOutlet weak var decrement: UIButton!
    
    @IBOutlet weak var quantityTextField: UITextField!
    
    var addToCartHandler: ((Int) -> Void)?
        
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func addOrRemoveProductFromCart() {
        let count = Basket.shared.cartInfo[product] ?? 0
        addToCartHandler?(count)
    }
    
    @IBAction func addRemoveProduct(_ sender: UIButton) {
        
        switch sender {
        case increment:
            Basket.shared.cartInfo[product, default: 0] += 1
        default:
            if Basket.shared.cartInfo[product] != nil {
                Basket.shared.cartInfo[product, default: 1] -= 1
            } else {
                Basket.shared.cartInfo[product] = nil
            }
        }
        
        if let count = Basket.shared.cartInfo[product] {
            productsNumberTF.text = String(count)
        }
    }
        
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
