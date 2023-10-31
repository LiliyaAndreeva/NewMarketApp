//
//  CartViewController.swift
//  NewMarketApp
//
//  Created by Лилия Андреева on 29.10.2023.
//

import UIKit

class CartViewController: UIViewController {
    
    private var productsInCart = ["Хлеб", "Молоко", "Яйца", "Торт", "Курица", "Гречка", "Рис"]
    
    @IBOutlet weak var bottomOrder: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Styles.secondaryBrown
        bottomOrder.backgroundColor = Styles.primaryBrown
        bottomOrder.clipsToBounds = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        bottomOrder.layer.cornerRadius = bottomOrder.bounds.height / 2
    }
    
}
    
extension CartViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        productsInCart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath)

        let product = productsInCart[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = productsInCart.first
        //content.secondaryText = productsInCart. здесь цена?
//        content.image = UIImage(named: track.title) для картинки имена из модели
//        content.imageProperties.cornerRadius = tableView.rowHeight / 2
//
//        cell.contentConfiguration = content
        
        return cell
    }
    
    
}

