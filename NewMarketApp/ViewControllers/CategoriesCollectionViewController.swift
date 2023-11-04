//  Created by Motherlode Team on 29.10.23.

import UIKit

final class CategoriesCollectionViewController: UICollectionViewController {
    
    let allCategories = DataStore.getAllCategories() //вынести в функцию?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor  = Styles.beige
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let productsTableVC = segue.destination as? ProductsTableViewController
        let selectedCategory = sender as? Categories
        
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
        productsTableVC?.products = selectedProducts
    }
}

// MARK: - Extension Table view data source

extension CategoriesCollectionViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        allCategories.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        let category = allCategories[indexPath.row]
        cell.imageView.image = UIImage(named: category.rawValue)
        cell.imageView.layer.cornerRadius = 20
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCategory = allCategories[indexPath.row]
        performSegue(withIdentifier: "cellCategory", sender: selectedCategory)
    }
}

