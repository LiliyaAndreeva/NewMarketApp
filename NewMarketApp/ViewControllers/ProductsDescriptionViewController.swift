//  Created by Motherlode Team on 29.10.23.

import UIKit

final class ProductsDescriptionViewController: UIViewController {
    
    var product: Product!
    
    @IBOutlet weak var descriptLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor  = Styles.secondaryBrown
        
        descriptLabel.text = product.shortDescription
    }

}
