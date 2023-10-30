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
                        case .groats:
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
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "firstCell", for: indexPath)
        let category = allCategories[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = category.rawValue
        cell.contentConfiguration = content
        // Configure the cell...
        return cell
    }
    
}
