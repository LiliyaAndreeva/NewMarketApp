final class DataStore {
    
    // MARK: - Синглтон
    static let shared = DataStore()
    
    // MARK: - Массивы
    let dairyProducts: [Product] = [
        Product(productName: "Молоко", 
                price: 2.1,
                shortDescription: "Fresh milk",
                imageName: "milk",
                category: .dairyProducts),
        Product(productName: "Сыр", 
                price: 3,
                shortDescription: "Aged cheddar",
                imageName: "cheese",
                category: .dairyProducts),
        Product(productName: "Творог", 
                price: 1.5,
                shortDescription:"Natural yogurt",
                imageName: "cotaggecheese",
                category: .dairyProducts)
    ]
    
    let bakery: [Product] = [
        Product(productName: "Хлеб", 
                price: 1.5,
                shortDescription: "Whole wheat bread",
                imageName: "bread", category: .bakery),
        Product(productName: "Баггет французский", 
                price: 2,
                shortDescription: "French baguette",
                imageName: "baguette",
                category: .bakery),
        Product(productName: "Круассан", 
                price: 1.6,
                shortDescription: "Buttery croissant",
                imageName: "cruassan",
                category: .bakery)
    ]
    
    let meatAndFish: [Product] = [
        Product(productName: "Говядина", 
                price: 1.5,
                shortDescription: "Lean beef",
                imageName: "beef",
                category: .meatAndFish),
        Product(productName: "Курица",
                price: 1.4,
                shortDescription: "Skinless chicken breast",
                imageName: "chicken",
                category: .meatAndFish),
        Product(productName: "Семга",
                price: 2,
                shortDescription: "Wild-caught salmon",
                imageName: "salmon",
                category: .meatAndFish),
    ]
    
    let fruitsAndVegetables: [Product] = [
        Product(productName: "Яблоки", 
                price: 1, 
                shortDescription: "Crisp apple",
                imageName: "apple",
                category: .fruitsAndVegetables),
        Product(productName: "Морковь",
                price: 0.5, 
                shortDescription: "Fresh carrot",
                imageName: "carrot",
                category: .fruitsAndVegetables),
        Product(productName: "Томаты", 
                price: 0.8,
                shortDescription: "Ripe tomato",
                imageName: "tomato",
                category: .fruitsAndVegetables),
    ]
    
    let groats: [Product] = [
        Product(productName: "Рис", 
                price: 2,
                shortDescription: "Long grain rice",
                imageName: "rice",
                category: .groats),
        Product(productName: "Паста",
                price: 1.05,
                shortDescription: "Whole wheat pasta",
                imageName: "spaghetti",
                category: .groats),
        Product(productName: "Бобы",
                price: 1.2,
                shortDescription: "Canned beans",
                imageName: "beans",
                category: .groats),
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
        
