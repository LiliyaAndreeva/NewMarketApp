//  Created by Motherlode Team on 29.10.23.

import UIKit

final class CategoriesTableViewController: UITableViewController {
    
    let allCategories = DataStore.getAllCategories()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor  = Styles.beige
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard  let indexPath = tableView.indexPathForSelectedRow else { return }
        let productVC = segue.destination as? ProductsTableViewController
        let selectedCategory = allCategories[indexPath.row]
        
        var selectedProducts: [Product]
        
        switch selectedCategory {
        case .dairyProducts:
            selectedProducts = DataStore.shared.dairyProducts
        case .bakery:
            selectedProducts = DataStore.shared.bakery
        case .meatAndFish:
            selectedProducts = DataStore.shared.meatAndFish
        case .fruitsAndVegetables:
            selectedProducts = DataStore.shared.fruitsAndVegetables
        default:
            selectedProducts = DataStore.shared.groats
        }
        
        productVC?.products = selectedProducts
    }

}

// MARK: - Extension Table view data source

extension CategoriesTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        allCategories.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let tableViewWidth = tableView.bounds.width
        let cellWidth = tableViewWidth * 0.4 // Например, ячейка будет занимать 40% ширины таблицы
        return cellWidth
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "firstCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        let category = allCategories[indexPath.row]

        content.text = category.rawValue
        cell.imageView?.image = UIImage(named: category.rawValue)
        
        return cell
    }
}
