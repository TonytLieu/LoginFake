//
//  ViewController.swift
//  LoginFake
//
//  Created by Tony Lieu on 3/4/24.
//

import UIKit

class LoginView: UIViewController, UITextFieldDelegate {
    let valildationVM = ValidationViewModel()
    //this is the title of this view
    private lazy var viewTitle: UILabel = {
        let viewTitle = UILabel()
        viewTitle.text = "Swift"
        viewTitle.textAlignment = .left
        viewTitle.font = UIFont.systemFont(ofSize: 40)
        viewTitle.textColor = .systemIndigo
        viewTitle.translatesAutoresizingMaskIntoConstraints = false
        viewTitle.layer.shadowColor = UIColor.black.cgColor
        viewTitle.layer.shadowOffset = CGSize(width: 0, height: 2)
        viewTitle.layer.shadowOpacity = 0.5
        viewTitle.layer.shadowRadius = 4
        return viewTitle
    }()
    // Add the text label acting as a button
    private lazy var createAccount: UILabel = {
        let label = makeLabel(text: NSLocalizedString("Create Account", comment: ""))
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(createAccountButtonTapped)))
        return label
    }()
    // Add the text label acting as a button
    private lazy var forgettenPassword: UILabel = {
        let label = makeLabel(text: NSLocalizedString("Forgotten Password", comment: ""))
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(forgettenButtonTapped)))
        return label
    }()
    //textField  for the user to unput username
    private lazy var userName: UITextField = {
        let textField = makeTextField(placeholder: NSLocalizedString("Username", comment: ""))
        return textField
    }()
    //textField for the password
    private lazy var password: UITextField = {
        let textField = makeTextField(placeholder: NSLocalizedString("Password", comment: ""))
        textField.isSecureTextEntry = true
        return textField
    }()
    
    //loginButton Componet
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(NSLocalizedString("Login", comment: ""), for: .normal) //this is more for localiztion for lang
        button.backgroundColor = .blue
        button.setTitleColor(.systemGroupedBackground, for: .normal)
        button.layer.cornerRadius = 20
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1.0
        button.layer.cornerRadius = 5.0
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowOpacity = 0.5
        button.layer.shadowRadius = 4
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        setupConstraints()
    }
    //setup function where the compent will be added to the view
    private func setupUI() {
        navigationItem.title = "FakeLogin"
        view.addSubview(viewTitle)
        view.addSubview(userName)
        view.addSubview(password)
        view.addSubview(loginButton)
        view.addSubview(createAccount)
        view.addSubview(forgettenPassword)
    }
    
    //setup where the componet will be placed
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            viewTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            viewTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            viewTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            viewTitle.heightAnchor.constraint(equalToConstant: 50),
            
            userName.topAnchor.constraint(equalTo: viewTitle.bottomAnchor, constant: 20),
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
            loginButton.heightAnchor.constraint(equalToConstant: 40),
            
            createAccount.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
            createAccount.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            createAccount.widthAnchor.constraint(equalToConstant: 120),
            createAccount.heightAnchor.constraint(equalToConstant: 40),
            
            forgettenPassword.topAnchor.constraint(equalTo: createAccount.bottomAnchor, constant: 20),
            forgettenPassword.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            forgettenPassword.widthAnchor.constraint(equalToConstant: 190),
            forgettenPassword.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    // will run when the login button is pushed
    @objc private func loginButtonTapped() {
        if valildationVM.loginVal(emailID: userName.text, passwordinput: password.text) {
            print("correct")
        }
        else{
            print("incorrect password")
            showAlertincorrect(errors: NSLocalizedString("Incorrect Username or Password", comment: ""))
            password.text = ""
        }
    }
    
    //show alert if the user put in incorrect password
    private func showAlertincorrect(errors: String) {
        let alert = UIAlertController(title: errors, message: NSLocalizedString("Please try again", comment: ""), preferredStyle: .alert) //this is more for localiztion for lang
        let okAction = UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default, handler: nil) //this is more for localiztion for lang
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    @objc private func forgettenButtonTapped() {
        print("Forgot Password label tapped!")
    }
    @objc private func createAccountButtonTapped() {
        print("Create accountlabel tapped!")
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    private func makeTextField(placeholder: String) -> UITextField {
        let textField = UITextField()
        textField.placeholder = placeholder
        textField.borderStyle = .roundedRect
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 5.0
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.shadowColor = UIColor.black.cgColor
        textField.layer.shadowOffset = CGSize(width: 0, height: 2)
        textField.layer.shadowOpacity = 0.5
        textField.layer.shadowRadius = 4
        return textField
    }
    
    private func makeLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = .blue
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}
