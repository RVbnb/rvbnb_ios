//
//  LandListedCollectionViewCell.swift
//  RvBNB
//
//  Created by Austin Potts on 9/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class LandListedCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var landListedImage: UIImageView!
    @IBOutlet weak var landListedLabel: UILabel!
    
    var listing: Listing? {
        didSet{
            updateViews()
        }
    }
    
    
    func updateViews(){
        guard let listing = listing else{return}
// UNCOMMENT// landListedImage.image = listing.landPhoto
        landListedLabel.text = listing.location
        
    }
    
    
}
