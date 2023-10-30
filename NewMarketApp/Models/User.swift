//  Created by Motherlode Team on 29.10.23.

import Foundation

struct User {
    let userId = UUID()
    let username: String
    let password: String
    let customer: Customer

    static func getUser() -> User {
        User(
            username: "Motherlode",
            password: "281023",
            customer: Customer.getCustomer()
            )
    }
}

struct Customer {
    let name: String
    let surname: String
    let email: String
    let cart = [Product?]()
    
    var fullname: String {
        "\(name) \(surname)"
    }
    
    static func getCustomer() -> Customer {
        Customer(
            name: "Motherload",
            surname: "Team",
            email: "motherload@icloud.com"
        )
    }
}

struct Product {
    let productId = UUID()
    let productName: String
    let price: Double
    let shortDescription : String
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

