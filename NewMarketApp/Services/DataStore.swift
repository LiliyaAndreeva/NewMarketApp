
import Foundation

class DataStore {
    
    // MARK: - Синглтон
    static let shared = DataStore()
    
    // MARK: - Массивы
    let dairyProducts: [Product] = [
        Product(name: "Молоко", category: .dairyProducts, price: 2.0, shortDescription: "Fresh milk"),
        Product(name: "Сыр", category: .dairyProducts, price: 3.0, shortDescription: "Aged cheddar"),
        Product(name: "Творог", category: .dairyProducts, price: 1.5, shortDescription: "Natural yogurt")
    ]
    
    let bakery: [Product] = [
        Product(name: "Хлеб", category: .bakery, price: 1.5, shortDescription: "Whole wheat bread"),
        Product(name: "Баггет французский", category: .bakery, price: 2.0, shortDescription: "French baguette"),
        Product(name: "Круассан", category: .bakery, price: 2.5, shortDescription: "Buttery croissant")
    ]
    
    let meatAndFish: [Product] = [
        Product(name: "Говядина", category: .meatAndFish, price: 5.0, shortDescription: "Lean beef"),
        Product(name: "Курица", category: .meatAndFish, price: 3.0, shortDescription: "Skinless chicken breast"),
        Product(name: "Семга", category: .meatAndFish, price: 7.0, shortDescription: "Wild-caught salmon")
    ]
    
    let fruitsAndVegetables: [Product] = [
        Product(name: "Яблоки", category: .fruitsAndVegetables, price: 1.0, shortDescription: "Crisp apple"),
        Product(name: "Морковь", category: .fruitsAndVegetables, price: 0.5, shortDescription: "Fresh carrot"),
        Product(name: "Томаты", category: .fruitsAndVegetables, price: 0.8, shortDescription: "Ripe tomato")
    ]
    
    let groats: [Product] = [
        Product(name: "Рис", category: .groats, price: 2.0, shortDescription: "Long grain rice"),
        Product(name: "Паста", category: .groats, price: 1.5, shortDescription: "Whole wheat pasta"),
        Product(name: "Бобы", category: .groats, price: 1.2, shortDescription: "Canned beans")
    ]
    
    // MARK: -  Приватный инициализатор, чтобы предотвратить создание дополнительных экземпляров класса
    private init() {
    }
}

 // MARK: - тут метод для работы с перечислениями в tableview

extension DataStore {
        static func getAllCategories() -> [Category] {
            return [
                .dairyProducts,
                .bakery,
                .meatAndFish,
                .fruitsAndVegetables,
                .groats
            ]
        }
    }
        
