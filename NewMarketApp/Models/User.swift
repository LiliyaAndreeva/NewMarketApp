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
    var cart: Cart
}

struct Cart {
    
    var products: [Product] = []

//    mutating func addProduct(_ product: Product) {
//        products.append(product)
//    }
//
//    mutating func removeProduct(at index: Int) {
//        products.remove(at: index)
//    }
}

struct Product {
    var name: String
    var category: Category
    var price: Double
}

enum Category {
    case dairyproducts
    case bakery
    case meatAndFish
    case fruitsAndVegetables
    case groats
}

