//
//  CustomProductTableViewCell.swift
//  NewMarketApp
//
//  Created by Admin on 31/10/2023.
//

import UIKit

protocol CartDelegate {
    func getIndex(_ index: Int) -> Int
}

final class CustomProductTableViewCell: UITableViewCell {
    var product: Product!
    var cart = [Product?]()
    
    @IBOutlet weak var productImage: UIImageView!
    
    @IBOutlet weak var productLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var increment: UIButton!
    @IBOutlet weak var decrement: UIButton!
    
    @IBOutlet weak var quantityTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private var count = 1
    private var price = 100
    private var summa = 0
    
    @IBAction func addRemoveProduct(_ sender: UIButton) {
        
        switch sender {
        case increment:
            cart.append(product)
        default:
            print("")
        }
        print(cart.count)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

            
//extension CustomProductTableViewCell: UITableViewDelegate {
////    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
////        tableView.indexPathForSelectedRow as?
//        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
////          let product = products[indexPath.row]
//            let index = tableView.indexPathForSelectedRow
//            let product = products[index?.row ?? 0]
//            cart.append(product)
//            print(index)
////          performSegue(withIdentifier: "showDetails", sender: product)
//         }
////    }
//}
