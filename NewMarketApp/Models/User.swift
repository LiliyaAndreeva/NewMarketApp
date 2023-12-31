//  Created by Motherlode Team on 29.10.23.

import Foundation

struct User {
    let userId = UUID()
    let username: String
    let password: String
    var customer: Customer

    static func getUser() -> User {
        User(
            username: "Motherlode",
            password: "281023",
            customer: Customer.getCustomer()
            )
    }
}

struct Customer {
    var name: String
    var surname: String
    var email: String
    let photo: String
    let cart = [Product?]()
    
    var fullname: String {
        "\(name) \(surname)"
    }
    
    static func getCustomer() -> Customer {
        Customer(
            name: "Motherload",
            surname: "Team",
            email: "motherload@icloud.com", 
            photo: "personphoto"
        )
    }
}
