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
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveButton(_ sender: Any) {
        guard let apiController = apiController else {return}
        guard let username = firstNameTextField.text, !username.isEmpty,
            let password = passwordTextField.text,!password.isEmpty else {return}
        let user = User(username: username, password: password, isLandOwner: false, context: CoreDataStack.shared.mainContext)
        DispatchQueue.main.async {
            apiController.registerUser(with: user)
            }
        
        
        
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
