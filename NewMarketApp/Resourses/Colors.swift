import UIKit

//enum Styles {
//    static let  brown = #colorLiteral(124
//    static let secondaryBrown = UIColor(red: 190, green: 159, blue: 151, alpha: 1)
//    static let beige = UIColor(red: 242, green: 233, blue: 226, alpha: 1)
//    
//}

enum Styles {
    static let primaryBrown =  #colorLiteral(red: 0.5634653568, green: 0.3501962721, blue: 0.3228268921, alpha: 1)
    static let secondaryBrown =  #colorLiteral(red: 0.7450980392, green: 0.6235294118, blue: 0.5921568627, alpha: 1)
    static let beige =  #colorLiteral(red: 0.9490196078, green: 0.9137254902, blue: 0.8862745098, alpha: 1)
}


//Шрифт для Лейблов
//Font: Custom
//Size: 45, 15
//Тк нужен шрифт под названием STTIX Two Text, но у него нет жирного выделения,
//я сначала выбрала шрифт - Times New Roman -> в style выбрала полужирный, а потом
//вернула шрифт STTIX Two Text и нужный шрифт остался жирный (лайфхак который сработал)

// Email и Password:
// Size: 20
// Шифт под названием Haragino Sans
// Style W3 остается по умолчанию

// Над кнопкой нужно поколдовать в коде, тк в сториборде не нашла как поменять шрифт на
// Hiragino Sans
// Размеры кнопки тоже примерные
// Закругления у кнопки можно сделать более явными
