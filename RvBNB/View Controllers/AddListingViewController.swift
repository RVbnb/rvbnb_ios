//
//  AddListingViewController.swift
//  RvBNB
//
//  Created by Austin Potts on 9/25/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class AddListingViewController: UIViewController {

    
    
    @IBOutlet weak var locationTextView: UITextField!
    @IBOutlet weak var landOwnerTextView: UITextField!
    @IBOutlet weak var contactTextView: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func saveListingButton(_ sender: Any) {
    }
    
    
    @IBAction func addLandImage(_ sender: Any) {
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
