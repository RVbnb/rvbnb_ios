//
//  ListYourLandViewController.swift
//  RvBNB
//
//  Created by Austin Potts on 9/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ListYourLandViewController: UIViewController {

    
    
    @IBOutlet weak var landImage: UIImageView!
    
    
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var ownerTextField: UIStackView!
    @IBOutlet weak var contactTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveButton(_ sender: Any) {
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
