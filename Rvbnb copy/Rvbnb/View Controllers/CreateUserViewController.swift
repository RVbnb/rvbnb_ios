//
//  CreateUserViewController.swift
//  Rvbnb
//
//  Created by brian vilchez on 9/25/19.
//  Copyright © 2019 brian vilchez. All rights reserved.
//

import UIKit

class CreateUserViewController: UIViewController {
    
    //MARK: - Properties
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Create your account."
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 30)
        return label
    }()
    
    private var nameView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 30
        return view
    }()
    
    private var nameTextField: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.placeholder = "enter your name"
        textfield.textColor = .darkGray
        return textfield
    }()

    private var emailView: UIView = {
    let view = UIView()
         view.translatesAutoresizingMaskIntoConstraints = false
         view.backgroundColor = .white
            view.layer.cornerRadius = 30
         return view
    }()
    
    private var emailTextField: UITextField = {
        let textfield = UITextField()
            textfield.translatesAutoresizingMaskIntoConstraints = false
            textfield.placeholder = "enter an email"
            textfield.textColor = .darkGray
            return textfield
    }()
    
    private var userNameView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 30
        return view
    }()
    
    private var usernameTextField: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.placeholder = "enter a username"
        textfield.textColor = .darkGray
        return textfield
    }()
    
    private var lineView3: UIView = {
          let view = UIView()
             view.translatesAutoresizingMaskIntoConstraints = false
             view.backgroundColor = .clear
            view.backgroundColor = .darkGray
             return view
    }()
    
    private var passwordView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 30
        return view
    }()
    
    private var passwordTextField: UITextField = {
        let textfield = UITextField()
            textfield.translatesAutoresizingMaskIntoConstraints = false
            textfield.placeholder = "create password"
            textfield.textColor = .darkGray
             return textfield
    }()
    
    private var doneButtonView: UIView = {
         let view = UIView()
         view.translatesAutoresizingMaskIntoConstraints = false
         view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
         view.layer.cornerRadius =   30
         return view
     }()
    
    private var doneButton: UIButton = {
           let button = UIButton()
               button.translatesAutoresizingMaskIntoConstraints = false
                button.titleLabel?.textColor = .darkGray
               button.setTitle("done", for: .normal)
               button.addTarget(self, action: #selector(nextButton), for: .touchUpInside)
            return button
       }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.1529411765, green: 0.6823529412, blue: 0.3764705882, alpha: 1)
        setupConstraints()
    }
    
//MARK: - methods
    @objc func nextButton(){
        
        
    }
    
    private func setupConstraints() {
        view.addSubview(titleLabel)
        titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        
        view.addSubview(nameView)
        nameView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        nameView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50).isActive = true
        nameView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60).isActive = true
        nameView.heightAnchor.constraint(equalToConstant: 60).isActive = true

        nameView.addSubview(nameTextField)
        nameTextField.leadingAnchor.constraint(equalTo: nameView.leadingAnchor, constant: 20).isActive = true
        nameTextField.topAnchor.constraint(equalTo: nameView.topAnchor,constant: 0).isActive = true
        nameTextField.trailingAnchor.constraint(equalTo: nameView.trailingAnchor,constant: -20).isActive = true
        nameTextField.bottomAnchor.constraint(equalTo: nameView.bottomAnchor).isActive = true
        
        view.addSubview(emailView)
        emailView.topAnchor.constraint(equalToSystemSpacingBelow: nameView.bottomAnchor, multiplier: 10).isActive = true
        emailView.leadingAnchor.constraint(equalTo: nameView.leadingAnchor).isActive = true
        emailView.trailingAnchor.constraint(equalTo: nameView.trailingAnchor).isActive = true
        emailView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        emailView.addSubview(emailTextField)
        emailTextField.leadingAnchor.constraint(equalTo: emailView.leadingAnchor, constant: 20).isActive = true
        emailTextField.topAnchor.constraint(equalTo: emailView.topAnchor, constant: 0).isActive = true
        emailTextField.trailingAnchor.constraint(equalTo: emailView.trailingAnchor, constant: -20).isActive = true
        emailTextField.bottomAnchor.constraint(equalTo: emailView.bottomAnchor).isActive = true
        
        view.addSubview(userNameView)
        userNameView.topAnchor.constraint(equalToSystemSpacingBelow: emailView.bottomAnchor, multiplier: 10).isActive = true
        userNameView.leadingAnchor.constraint(equalTo: emailView.leadingAnchor).isActive = true
        userNameView.trailingAnchor.constraint(equalTo: emailView.trailingAnchor).isActive = true
        userNameView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        userNameView.addSubview(usernameTextField)
        usernameTextField.leadingAnchor.constraint(equalTo: userNameView.leadingAnchor,constant: 20).isActive = true
        usernameTextField.topAnchor.constraint(equalTo: userNameView.topAnchor).isActive = true
        usernameTextField.trailingAnchor.constraint(equalTo: userNameView.trailingAnchor, constant: -20).isActive = true
        usernameTextField.bottomAnchor.constraint(equalTo: userNameView.bottomAnchor).isActive = true
        
        view.addSubview(passwordView)
        passwordView.topAnchor.constraint(equalToSystemSpacingBelow: userNameView.bottomAnchor, multiplier: 10).isActive = true
        passwordView.leadingAnchor.constraint(equalTo: userNameView.leadingAnchor).isActive = true
        passwordView.trailingAnchor.constraint(equalTo: userNameView.trailingAnchor).isActive = true
        passwordView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        passwordView.addSubview(passwordTextField)
        passwordTextField.leadingAnchor.constraint(equalTo: passwordView.leadingAnchor,constant: 20).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: passwordView.topAnchor).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: passwordView.trailingAnchor, constant: -20).isActive = true
        passwordTextField.bottomAnchor.constraint(equalTo: passwordView.bottomAnchor).isActive = true
        
        view.addSubview(doneButtonView)
        doneButtonView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        doneButtonView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 290).isActive = true
        doneButtonView.topAnchor.constraint(equalTo: passwordView.bottomAnchor, constant: 100).isActive = true
        doneButtonView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        doneButtonView.addSubview(doneButton)
        doneButton.topAnchor.constraint(equalTo: doneButtonView.topAnchor).isActive = true
        doneButton.leadingAnchor.constraint(equalTo: doneButtonView.leadingAnchor).isActive = true
        doneButton.trailingAnchor.constraint(equalTo: doneButtonView.trailingAnchor).isActive = true
        doneButton.bottomAnchor.constraint(equalTo: doneButtonView.bottomAnchor).isActive = true
     
    }

    
}
