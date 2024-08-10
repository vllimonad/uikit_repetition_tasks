//
//  ViewController.swift
//  task_4
//
//  Created by Vlad Klunduk on 09/08/2024.
//

import UIKit

class ViewController: UIViewController {
    
    var usernameTextField = UITextField()
    var passwordTextField = UITextField()
    
    var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.black
        button.layer.cornerRadius = 18
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.gray.cgColor
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    var stack: UIStackView = {
        var stack = UIStackView()
        stack.spacing = 10
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    var users = [User(username: "test", password: "1234")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubviews()
        setupLayout()
    }
    
    func addSubviews() {
        usernameTextField.customize("Username")
        passwordTextField.customize("Password")
        stack.addArrangedSubview(usernameTextField)
        stack.addArrangedSubview(passwordTextField)
        view.addSubview(stack)
        view.addSubview(loginButton)
    }
    
    func setupLayout() {
        NSLayoutConstraint.activate([
            usernameTextField.heightAnchor.constraint(equalToConstant: 34),
            passwordTextField.heightAnchor.constraint(equalToConstant: 34),
            
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            loginButton.topAnchor.constraint(equalTo: stack.bottomAnchor, constant: 32),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            loginButton.heightAnchor.constraint(equalToConstant: 34),
        ])
        
    }
    
    @objc func buttonTapped() {
        users.forEach { user in
            if user.username == usernameTextField.text, user.password == passwordTextField.text {
                navigationController?.pushViewController(TabBarController(), animated: true)
            }
        }
    }
    
    
    func showAlert(_ title: String) {
        let ac = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
}



extension UITextField {
    func customize(_ placeholderText: String) {
        autocapitalizationType = .none
        placeholder = placeholderText
        leftViewMode = .always
        leftView = UIView(frame: CGRect(x:0,y:0,width:16,height:0))
        layer.cornerRadius = 18
        layer.borderWidth = 1
        layer.borderColor = UIColor.gray.cgColor
        translatesAutoresizingMaskIntoConstraints = false
    }
}
