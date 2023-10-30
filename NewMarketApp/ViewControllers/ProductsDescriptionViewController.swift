//
//  DescriptionOfProductsViewController.swift
//  NewMarketApp
//
//  Created by Лилия Андреева on 29.10.2023.
//

import UIKit

class ProductsDescriptionViewController: UIViewController {
    
    var product: Product!
    
    @IBOutlet weak var descriptLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor  = Styles.secondaryBrown
        
        descriptLabel.text = product.shortDescription
    }

}
