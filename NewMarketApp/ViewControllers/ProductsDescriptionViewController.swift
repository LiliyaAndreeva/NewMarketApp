//  Created by Motherlode Team on 29.10.23.

import UIKit


final class ProductsDescriptionViewController: UIViewController {
    
    
    var product: Product!

    
    @IBOutlet weak var imageOfProduct: UIImageView!
    @IBOutlet weak var descriptLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Styles.secondaryBrown
        imageOfProduct.image = UIImage(named: product.imageName)
        descriptLabel.text = product.shortDescription
    }
  
    @IBAction func addToCartDidTapped(_ sender: UIButton) {
        Basket.shared.selectedProduct = product
    }
}
