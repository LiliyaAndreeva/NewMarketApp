//  Created by Motherlode Team on 29.10.23.

import UIKit

final class CartViewController: UIViewController {
    
    var user: User!
    
    @IBOutlet weak var cartTable: UITableView!
    @IBOutlet weak var bottomOrder: UIButton!
    
    @IBOutlet weak var totalSumLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Styles.secondaryBrown
        bottomOrder.backgroundColor = Styles.primaryBrown
        bottomOrder.clipsToBounds = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let orderVC = segue.destination as? OrderViewController else { return }
        orderVC.user = user
    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // При возвращении на этот экран
        cartTable.reloadData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        bottomOrder.layer.cornerRadius = bottomOrder.bounds.height / 2
    }
}
    
// MARK: - UITableViewDataSourse
extension CartViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Basket.shared.cartInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as? CartViewCell else { return UITableViewCell() }
       
        let uniqProducts = Basket.shared.cartInfo.map{ $0.key }
        let product = uniqProducts[indexPath.row]
        cell.product = product
        
        cell.productLabel.text = product.productName
        cell.priceLabel.text = "\(product.price) ₽"
        
        let productPrice = product.price * Double(Basket.shared.cartInfo[product] ?? 0)
        cell.totalOneProductsPriceLabel.text = String(format: "%.2f", productPrice) + " ₽"

        cell.productQuantityTF.text = String(Basket.shared.cartInfo[product] ?? 0)
        cell.imageView?.image = UIImage(named: product.imageName)
        
        let totalSum = Basket.shared.cartInfo.reduce(0) {
            $0 + ($1.key.price * Double($1.value))
        }
        totalSumLabel.text = String(format: "%.2f", totalSum) + " ₽"
        
        cell.finaResult = totalSum
        
        cell.contentView.backgroundColor = .white
        cell.delegate = self
        return cell
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}

// MARK: - UITableViewDelegate
extension CartViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let tableViewWidth = tableView.bounds.width
        let cellWidth = tableViewWidth * 0.15 // ячейка будет занимать % ширины таблицы
        return cellWidth
    }
}

// MARK: - UITextFieldDelegate
extension CartViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    } //убирает клавиатуру
}

extension CartViewController: CartCellDelegate {
    
    func productAmountChanged() {
        let totalSum = Basket.shared.cartInfo.reduce(0) {
            $0 + ($1.key.price * Double($1.value))
        }
        
        totalSumLabel.text = String(format: "%.2f", totalSum) + "₽"
    }
}
