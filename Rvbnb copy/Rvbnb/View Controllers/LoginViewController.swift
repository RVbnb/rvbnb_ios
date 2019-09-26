//
//  LoginViewController.swift
//  Rvbnb
//
//  Created by brian vilchez on 9/25/19.
//  Copyright © 2019 brian vilchez. All rights reserved.
//

import UIKit
protocol loginButtonSegueDelegate {
    func intiateSegue()
}

class LoginViewController: UIViewController, loginButtonSegueDelegate {
    
    //MARK: - Properties
    private var loginView: loginView!
   
    //MARK: - View Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = #colorLiteral(red: 0.1529411765, green: 0.6823529412, blue: 0.3764705882, alpha: 1)
        
    }
    
    //MARK: - Methods
    func intiateSegue() {
      loginView.segueDelegate = self
        performSegue(withIdentifier: "UserProfileSegue", sender: self)
        let UserProfileStoryBoard = UIStoryboard(name: "Main", bundle:Bundle.main)
                   let userProfileVC = UserProfileStoryBoard.instantiateViewController(withIdentifier: "UserProfile") as! UserProfileViewController
                               present(userProfileVC, animated: true, completion: nil)
      }


}
