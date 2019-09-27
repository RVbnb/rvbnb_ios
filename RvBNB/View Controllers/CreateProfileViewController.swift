//
//  CreateProfileViewController.swift
//  RvBNB
//
//  Created by Austin Potts on 9/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit
import CoreData

class CreateProfileViewController: UIViewController {

    
    
    var apiController: ApiController?
    var user: User?
    
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func saveButton(_ sender: Any) {
       // guard let apiController = apiController else {return}
        guard let username = firstNameTextField.text, !username.isEmpty,
            let password = passwordTextField.text,!password.isEmpty else {return}
        
        if let user = user {
            apiController?.updateUser(user: user, with: username , password: password)
        } else {
            apiController?.createUser(with: username, passwword: password, isLandOwner: false)
        }
        
        navigationController?.popViewController(animated: true)
    }
        
        
        
        
//        let user = User(username: username, password: password, isLandOwner: false, context: CoreDataStack.share.mainContext)
//        DispatchQueue.main.async {
//           // apiController.registerUser(with: user)
//            self.dismiss(animated: true, completion: nil)
//
//            }
        
        
        
            
    
    
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
