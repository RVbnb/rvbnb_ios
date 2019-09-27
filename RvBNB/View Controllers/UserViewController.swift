//
//  UserViewController.swift
//  RvBNB
//
//  Created by Austin Potts on 9/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit
import CoreData

class UserViewController: UIViewController {

    
    var users: [User] {
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        
        do {
            let users = try CoreDataStack.share.mainContext.fetch(fetchRequest)
            return users
        } catch {
            NSLog("Error fetching tasks: \(error)")
            return []
        }
    }
    
    var apiController: ApiController?
   // var user: User?
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    
    
    
    @IBAction func takeMeBackUnwind(_ sender: Any) {
        performSegue(withIdentifier: "unwindSegueToVC1", sender: self)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }
    

    func updateViews(){
        
      // nameLabel.text = users.username
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
