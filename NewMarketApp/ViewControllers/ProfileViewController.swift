//
//  ProfileViewController.swift
//  NewMarketApp
//
//  Created by Лилия Андреева on 29.10.2023.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    @IBOutlet weak var userImage: UIImageView! {
        didSet {
            userImage.layer.cornerRadius = userImage.frame.height / 2
        }
    }
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    //@IBOutlet weak var nameLabel: UILabel!
    //@IBOutlet weak var surnameLabel: UILabel!
    //@IBOutlet weak var emailLabel: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = """
        Добро пожаловать,
        \(user.username)!
        """

        userImage.image = UIImage(named: user.customer.photo)
        //nameLabel.text = user.customer.name
        //surnameLabel.text = user.customer.surname
        //emailLabel.text = user.customer.email
        
        nameTextField.text = user.customer.name
        surnameTextField.text = user.customer.surname
        emailTextField.text = user.customer.email
    }
}

//extension ProfileViewController: UITextFieldDelegate {
    //func tetete(_ textField: UITextField) {
       // if textField == nameTextField {
        //    user.customer.name = textField.text ?? ""
       // } else {
      //      user.customer.surname = textField.text ?? ""
       // }
    //}
//}
