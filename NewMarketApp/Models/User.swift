//
//  User.swift
//  NewMarketApp
//
//  Created by Roman on 29.10.23.
//

struct User {
    
    var username: String
    var password: String
    var fullname: String
    var email: String
    var cart: Cart?
    
    static func getUser() -> User {
        User(
            username: "Motherlode",
            password: "281023",
            fullname: "Motherload team",
            email: "motherload@icloud.com",
            cart: nil
        )
    }
}
    struct Cart {
        var products: [Product] = []
    }
    
struct Product {
    var name: String
    var category: Category
    var price: Double
    var shortDescription : String

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
    
enum Category: String {
    case dairyProducts = "Молочные продукты"
    case bakery = "Хлебобулочные изделия"
    case meatAndFish = "Мясо и рыба"
    case fruitsAndVegetables = "Фрукты и овощи"
    case groats = "Крупы"
}

