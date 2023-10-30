final class DataStore {
    
    // MARK: - Синглтон
    static let shared = DataStore()
    
    // MARK: - Массивы
    let dairyProducts: [Product] = [
        Product(productName: "Молоко", price: 2.1, shortDescription: "Fresh milk", category: .dairyProducts),
        Product(productName: "Сыр", price: 3, shortDescription: "Aged cheddar", category: .dairyProducts),
        Product(productName: "Творог", price: 1.5, shortDescription:"Natural yogurt", category: .dairyProducts)
    ]
    
    let bakery: [Product] = [
        Product(productName: "Хлеб", price: 1.5, shortDescription: "Whole wheat bread", category: .bakery),
        Product(productName: "Баггет французский", price: 2, shortDescription: "French baguette", category: .bakery),
        Product(productName: "Круассан", price: 1.6, shortDescription: "Buttery croissant", category: .bakery)
    ]
    
    let meatAndFish: [Product] = [
        Product(productName: "Говядина", price: 1.5, shortDescription: "Lean beef", category: .meatAndFish),
        Product(productName: "Курица", price: 1.4, shortDescription: "Skinless chicken breast", category: .meatAndFish),
        Product(productName: "Семга", price: 2, shortDescription: "Wild-caught salmon", category: .meatAndFish),
    ]
    
    let fruitsAndVegetables: [Product] = [
        Product(productName: "Яблоки", price: 1, shortDescription: "Crisp apple", category: .fruitsAndVegetables),
        Product(productName: "Морковь", price: 0.5, shortDescription: "Fresh carrot", category: .fruitsAndVegetables),
        Product(productName: "Томаты", price: 0.8, shortDescription: "Ripe tomato", category: .fruitsAndVegetables),
    ]
    
    let groats: [Product] = [
        Product(productName: "Рис", price: 2, shortDescription: "Long grain rice", category: .groats),
        Product(productName: "Паста", price: 1.05, shortDescription: "Whole wheat pasta", category: .groats),
        Product(productName: "Бобы", price: 1.2, shortDescription: "Canned beans", category: .groats),
    ]
    
    // MARK: -  Приватный инициализатор, чтобы предотвратить создание дополнительных экземпляров класса
    private init() {}
}

 // MARK: - тут метод для работы с перечислениями в tableview

extension DataStore {
        static func getAllCategories() -> [Categories] {
            return [
                .dairyProducts,
                .bakery,
                .meatAndFish,
                .fruitsAndVegetables,
                .groats
            ]
        }
    }
        
