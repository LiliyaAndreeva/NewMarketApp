//  Created by Motherlode Team on 29.10.23.

import UIKit


final class ProductsDescriptionViewController: UIViewController {
    
    
    var product: Product!

    
    @IBOutlet weak var imageOfProduct: UIImageView!
    @IBOutlet weak var descriptLabel: UILabel!
    
    @IBOutlet weak var addToCartButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Styles.secondaryBrown
        imageOfProduct.image = UIImage(named: product.imageName)
        descriptLabel.text = product.shortDescription
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageOfProduct.layer.cornerRadius = 20
        addToCartButton.layer.cornerRadius = addToCartButton.bounds.height / 2
    }
  
    @IBAction func addToCartDidTapped(_ sender: UIButton) {
        Basket.shared.cartProducts.append(product)
        showAlert(with: "Товар успешно добавлен в корзину", and: "Вы можете перейти к оформлению заказа или продолжить покупки")
    }
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        present(alert, animated: true)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
    }
}

