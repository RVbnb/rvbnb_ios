//
//  loginView.swift
//  Rvbnb
//
//  Created by brian vilchez on 9/25/19.
//  Copyright © 2019 brian vilchez. All rights reserved.
//

import UIKit

class loginView: UIView {
    
    
  //MARK: - lifeCycle
   required init?(coder: NSCoder) {
       super.init(coder: coder)
       setupConstraints()
   }
    
    
//MARK: - properties
 var loginSegueDelegate: loginButtonSegueDelegate?
 var signupSegueDelegate: SignUpbuttonSegueDelegate?
    
private var loginButton: UIButton = {
          let button = UIButton()
          button.translatesAutoresizingMaskIntoConstraints = false
          button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
             button.titleLabel?.textColor = .white
          button.addTarget(self, action: #selector(LoginButton), for: .touchUpInside)
          return button
      }()
    
    private var signUpButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.setTitle("Sign Up", for: .normal)
        button.tintColor = .blue
        button.setTitleColor(.blue, for: .normal)
        //button.titleLabel?.textColor = .blue
       // button.backgroundColor = .blue
        button.titleLabel?.textAlignment = .left
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.addTarget(self, action: #selector(SignUpButton), for: .touchUpInside)
        return button
    }()
    
    
private var loginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 25)
        label.text = "Login"
        label.textColor = .black
    label.textAlignment = .center
        return label
    }()
    
 var passwordView: UIView = {
         let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = #colorLiteral(red: 0.9254901961, green: 0.9411764706, blue: 0.9450980392, alpha: 1)
        view.layer.cornerRadius =   30
               return view
    }()
    
 var usernameBoxView: UIView = {
         let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = #colorLiteral(red: 0.9254901961, green: 0.9411764706, blue: 0.9450980392, alpha: 1)
    view.layer.cornerRadius = 30
    return view
    }()
    
     lazy var passwordTextfield: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.textColor = .darkGray
        textfield.placeholder = "enter password"
        textfield.isSecureTextEntry = true 
        return textfield
    }()
    
    
 lazy var usernameTextfield: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.textColor = .darkGray
        textfield.placeholder = "enter username"
        return textfield
    }()
    
private var loginView: UIView = {
           let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.layer.masksToBounds = false
    view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    view.layer.cornerRadius = 20
    view.layer.shadowRadius = 20
        return view
       }()
    
    private var loginButtonView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.1529411765, green: 0.6823529412, blue: 0.3764705882, alpha: 1)
        view.layer.cornerRadius =   30
        return view
    }()
    
    private var createAccountLabel: UILabel = {
           let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.systemFont(ofSize: 15)
            label.text = "Create your account 👉🏻"
      //  label.backgroundColor = .blue
            label.textColor = .darkGray
        label.textAlignment = .right
        return label
    }()
    
    
    
    //MARK: - Methods
@objc func LoginButton() {
        guard let username = usernameTextfield.text,!username.isEmpty,
            let password = passwordTextfield.text, !password.isEmpty else {return}
            print("\(username), \(password)")
            loginSegueDelegate?.intiateLoginSegue()
      
        }
    
    @objc func SignUpButton() {
       
        signupSegueDelegate?.intiateSignupSegue()
    }
    
   private func setupConstraints() {
        
        addSubview(loginView)
        loginView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 200).isActive = true
        loginView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        loginView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        loginView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -200).isActive = true
        
        loginView.addSubview(loginLabel)
        loginLabel.topAnchor.constraint(equalTo: loginView.topAnchor, constant: 20).isActive = true
        loginLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 20).isActive = true
        loginLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -20).isActive = true
        

        loginView.addSubview(usernameBoxView)
        usernameBoxView.topAnchor.constraint(equalToSystemSpacingBelow: loginLabel.bottomAnchor, multiplier: 2).isActive = true
        usernameBoxView.leadingAnchor.constraint(equalTo: loginView.leadingAnchor,constant: 10).isActive = true
        usernameBoxView.trailingAnchor.constraint(equalTo:loginView.trailingAnchor,constant: -10).isActive = true
        usernameBoxView.heightAnchor.constraint(equalToConstant: 70).isActive = true
    
        usernameBoxView.addSubview(usernameTextfield)
        usernameTextfield.leadingAnchor.constraint(equalTo: usernameBoxView.leadingAnchor, constant: 15).isActive = true
        usernameTextfield.trailingAnchor.constraint(equalTo: usernameBoxView.trailingAnchor, constant: -10).isActive = true
        usernameTextfield.topAnchor.constraint(equalTo: usernameBoxView.topAnchor, constant: 0).isActive = true
        usernameTextfield.bottomAnchor.constraint(equalTo: usernameBoxView.bottomAnchor, constant: 0).isActive = true
    
        loginView.addSubview(passwordView)
        passwordView.topAnchor.constraint(equalToSystemSpacingBelow: usernameBoxView.bottomAnchor, multiplier: 2).isActive = true
        passwordView.leadingAnchor.constraint(equalTo: loginView.leadingAnchor,constant: 10).isActive = true
        passwordView.trailingAnchor.constraint(equalTo:loginView.trailingAnchor,constant: -10).isActive = true
        passwordView.heightAnchor.constraint(equalToConstant: 70).isActive = true
    
    
        passwordView.addSubview(passwordTextfield)
        passwordTextfield.leadingAnchor.constraint(equalTo: passwordView.leadingAnchor, constant: 15).isActive = true
        passwordTextfield.trailingAnchor.constraint(equalTo: passwordView.trailingAnchor, constant: -10).isActive = true
        passwordTextfield.topAnchor.constraint(equalTo: passwordView.topAnchor, constant: 0).isActive = true
        passwordTextfield.bottomAnchor.constraint(equalTo: passwordView.bottomAnchor, constant: 0).isActive = true
    
        loginView.addSubview(loginButtonView)
        loginButtonView.topAnchor.constraint(equalToSystemSpacingBelow: passwordView.bottomAnchor, multiplier: 2).isActive = true
        loginButtonView.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 100).isActive = true
        loginButtonView.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -100).isActive = true
        loginButtonView.heightAnchor.constraint(equalToConstant: 70).isActive = true
    
        loginButtonView.addSubview(loginButton)
    loginButton.leadingAnchor.constraint(equalTo: loginButtonView.leadingAnchor).isActive = true
    loginButton.trailingAnchor.constraint(equalTo: loginButtonView.trailingAnchor).isActive = true
    loginButton.topAnchor.constraint(equalTo: loginButtonView.topAnchor).isActive = true
    loginButton.bottomAnchor.constraint(equalTo: loginButtonView.bottomAnchor).isActive = true
    
    
    loginView.addSubview(createAccountLabel)
    createAccountLabel.topAnchor.constraint(equalToSystemSpacingBelow: loginButtonView.bottomAnchor, multiplier: 5).isActive = true
    createAccountLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 10).isActive = true
    createAccountLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -170).isActive = true
   loginView.addSubview(signUpButton)
    signUpButton.topAnchor.constraint(equalToSystemSpacingBelow: loginButtonView.bottomAnchor, multiplier: 4.5).isActive = true
    signUpButton.leadingAnchor.constraint(equalTo: createAccountLabel.trailingAnchor, constant: 5).isActive = true
    signUpButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -70 ).isActive = true

    
    
    
    }
}
