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
    
    var landListing: ListingRepresentation? {
        didSet{
            updateViews()
        }
    }
    
    
    func updateViews(){
        guard let listing = landListing else{return}

        landListedLabel.text = listing.location
        landListedImage.image = listing.landPhoto
    }
    
    
}
