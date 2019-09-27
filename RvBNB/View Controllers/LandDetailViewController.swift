//
//  LandDetailViewController.swift
//  RvBNB
//
//  Created by Austin Potts on 9/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class LandDetailViewController: UIViewController {

    
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var landOwnerLabel: UILabel!
    @IBOutlet weak var contactNumberLabel: UILabel!
    
    @IBOutlet weak var landImage: UIImageView!
    
    
    @IBAction func scheduleStayButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        showAlert()
    }
    
    
    var land: ListingRepresentation?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }
    
    func updateViews(){
        if let land = land {
            locationLabel.text = land.location
            landImage.image = land.landPhoto
        }
        
        
    }
    
    
    
    private func showAlert(){
        let alert = UIAlertController(title: "Your land has been reserved.", message: "Thank you! Your arraged stay date(s) will be emailed to you", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
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
