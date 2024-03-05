//
//  ViewController.swift
//  LoginFake
//
//  Created by Tony Lieu on 3/4/24.
//

import UIKit

class LoginView: UIViewController, UITextFieldDelegate {
    let valildationVM = ValidationViewModel()
    //textField for the userName
    private lazy var viewTitle: UILabel = {
        let viewTitle = UILabel()
        viewTitle.text = "Swift"
        viewTitle.textAlignment = .center
        viewTitle.font = UIFont.systemFont(ofSize: 40)
        viewTitle.textColor = .systemGroupedBackground
        viewTitle.translatesAutoresizingMaskIntoConstraints = false
        return viewTitle
    }()
    
    private lazy var userName: UITextField = {
        let textField = UITextField()
        //this is more for localiztion for lang
        textField.placeholder = NSLocalizedString("Username", comment: "")
        textField.borderStyle = .roundedRect
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    //textField for the password
    private lazy var password: UITextField = {
        let textField = UITextField()
        //this is more for localiztion for lang
        textField.placeholder = NSLocalizedString("Password", comment: "")
        textField.isSecureTextEntry = true // Mask the characters for password
        textField.borderStyle = .roundedRect
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    //loginButton Componet
     private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
         //this is more for localiztion for lang
        button.setTitle(NSLocalizedString("Login", comment: ""), for: .normal)
        button.backgroundColor = .blue
        button.setTitleColor(.systemGroupedBackground, for: .normal)
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
    }
    
    private func setupUI() {
        navigationItem.title = "FakeLogin"
        view.addSubview(viewTitle)
        view.addSubview(userName)
        view.addSubview(password)
        view.addSubview(loginButton)
    }
    
    //setup where the componet will be placed
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            viewTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            viewTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            viewTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            viewTitle.heightAnchor.constraint(equalToConstant: 50),
            
            userName.topAnchor.constraint(equalTo: viewTitle.safeAreaLayoutGuide.topAnchor, constant: 100),
            userName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            userName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            userName.heightAnchor.constraint(equalToConstant: 50),
            
            password.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 20),
            password.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            password.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            password.heightAnchor.constraint(equalToConstant: 50),
            
            loginButton.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 20),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: 100),
            loginButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    // will run when the login button is pushed
    @objc private func loginButtonTapped() {
        if valildationVM.loginVal(emailID: userName.text, passwordinput: password.text) {
            print("correct")
        }
        else{
            
            print("incorrect password")
            showAlertincorrect(errors: NSLocalizedString("incorrect username or password", comment: ""))
            password.text = ""
        }
     }
    
    //show alert if the user put in incorrect password
    private func showAlertincorrect(errors: String) {
        //this is more for localiztion for lang
        let alert = UIAlertController(title: errors, message: NSLocalizedString("Please try again later", comment: ""), preferredStyle: .alert)
        let okAction = UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
