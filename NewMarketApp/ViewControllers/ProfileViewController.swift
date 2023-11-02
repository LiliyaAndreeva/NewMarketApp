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
    
    //weak var delegate: ProfileViewControllerDelegate?
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = """
        Добро пожаловать,
        \(user.username)!
        """

        userImage.image = UIImage(named: user.customer.photo)
        
        nameTextField.delegate = self
        surnameTextField.delegate = self
        emailTextField.delegate = self
        
        nameTextField.text = user.customer.name
        surnameTextField.text = user.customer.surname
        emailTextField.text = user.customer.email
    }
}

extension ProfileViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
       if textField == nameTextField {
        user.customer.name = textField.text ?? ""
        } else if textField == surnameTextField {
            user.customer.surname = textField.text ?? ""
        } else {
            user.customer.email = textField.text ?? ""
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
