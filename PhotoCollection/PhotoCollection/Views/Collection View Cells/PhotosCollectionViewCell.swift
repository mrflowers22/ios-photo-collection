//
//  PhotosCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Michael Flowers on 5/2/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    var photo: Photo? {
        didSet {
            //observe this property so that when it is not nil, which means its holding a value, we want to update the views
            updateViews()
        }
    }
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    
    func updateViews(){
        guard let passedInPhoto = photo else { return }
        
        //turn the image data into a UIImage
        let imageData = passedInPhoto.imageData
        guard let image = UIImage(data: imageData) else { print("do not have an image to display") ; return }
        
        //now that we have a UIImage we can update the image property on imageView to update the view
        imageView.image = image
        
        //update the text property on the label
        label.text = passedInPhoto.title
    }
}
