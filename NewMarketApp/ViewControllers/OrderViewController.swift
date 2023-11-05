//  Created by Motherlode Team on 29.10.23.

import UIKit

final class OrderViewController: UIViewController {
    var user: User!
    
    @IBOutlet weak var orderInMail: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Styles.secondaryBrown
        orderInMail.text = "Информация о заказе придет на ваш email \(user.customer.email)"
    }
}
