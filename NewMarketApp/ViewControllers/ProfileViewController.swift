//  Created by Motherlode Team on 29.10.23.

import UIKit

final class ProfileViewController: UIViewController {
    
    @IBOutlet weak var userImage: UIImageView! {
        didSet {
            userImage.layer.cornerRadius = userImage.frame.height / 2
        }
    }
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = """
        Добро пожаловать,
        \(user.username)!
        """

        userImage.image = UIImage(named: user.customer.photo)
        
        nameLabel.text = user.customer.name
        surnameLabel.text = user.customer.surname
        emailLabel.text = user.customer.email
    }
}
