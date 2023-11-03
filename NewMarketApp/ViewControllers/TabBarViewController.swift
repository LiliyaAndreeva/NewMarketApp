//
//  TabBarViewController.swift
//  NewMarketApp
//
//  Created by Лилия Андреева on 29.10.2023.
//

import UIKit

final class TabBarViewController: UITabBarController {
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appearance = UITabBarAppearance()
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
        
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

