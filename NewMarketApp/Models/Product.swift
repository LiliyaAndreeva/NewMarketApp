//  Created by Motherlode Team on 29.10.23.

import Foundation

struct Product: Hashable {
    let productId = UUID()
    let productName: String
    let price: Double
    let shortDescription: String
    let imageName: String
    let category: Categories
    
    static func getDairyProducts() -> [Product] {
        return DataStore.shared.dairyProducts
    }
    
    static func getBakeryProducts() -> [Product] {
        return DataStore.shared.bakery
    }
    
    static func getMeatAndFishProducts() -> [Product] {
        return DataStore.shared.meatAndFish
    }
    
    static func getFruitsAndVegetablesProducts() -> [Product] {
        return DataStore.shared.fruitsAndVegetables
    }
    
    static func getGroatsProducts() -> [Product] {
        return DataStore.shared.groats
    }
}
    
enum Categories: String {
    case dairyProducts = "milkproducts"
    case bakery = "breadproducts"
    case meatAndFish = "meatandfish"
    case fruitsAndVegetables = "fruitsandveg"
    case groats = "goats"
}

