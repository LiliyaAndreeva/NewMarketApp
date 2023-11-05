//  Created by Motherlode Team on 29.10.23.

import UIKit

final class TabBarViewController: UITabBarController {
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appearance = UITabBarAppearance()
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
        self.tabBar.layer.cornerRadius = self.tabBar.frame.size.height / 1
        self.tabBar.clipsToBounds = true

        transferData()
    }

    private func transferData() {
        guard let viewControllers else { return }
        
        viewControllers.forEach {
            if let userVC = $0 as? ProfileViewController {
                userVC.user = user
                
            } else if let navigationVC = $0 as? UINavigationController {
                let cartInfoVC = navigationVC.topViewController
                
                if  let cartInfoVC = cartInfoVC as? CartViewController{
                    cartInfoVC.user = user
                }
            }
        }
    }
}

