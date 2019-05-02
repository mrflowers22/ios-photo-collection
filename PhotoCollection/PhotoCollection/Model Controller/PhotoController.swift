//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Michael Flowers on 5/2/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

import Foundation

class PhotoController {
    var photos = [Photo]() //data source of truth
    
    func create(photoWith imageData: Data, and title: String) {
        let newPhoto = Photo(imageData: imageData, title: title)
        
        //add newPhoto to the empty photos array
        photos.append(newPhoto)
    }
    
    func update(photo: Photo, with newImageData: Data, and newTitle: String){
        photo.imageData = newImageData
        photo.title = newTitle
    }
    ///dummy code right here
}
