//
//  LoginViewController.swift
//  NewMarketApp
//
//  Created by Лилия Андреева on 29.10.2023.
//

import UIKit

final class LoginViewController: UIViewController {
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    private let user = User.getUser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTextField.text = user.username
        passwordTextField.text = user.password
        print("User ID: ", user.userId)
        nextButton.clipsToBounds = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? TabBarViewController else {
            return
        }
        tabBarController.user = user
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        nextButton.layer.cornerRadius = nextButton.bounds.height / 2
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @IBAction func nextButtonPressed() {
        guard userNameTextField.text == user.username,
                passwordTextField.text == user.password else {
            showAlert(
                title: "Неправильный логин или пароль",
                message: "Пожалуйста, введите корректные данные!",
                textField: passwordTextField
            )
            return
        }
    }
    
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
