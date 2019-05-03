//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by Michael Flowers on 5/2/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {
    
    let pc = PhotoController()
    let themeHelper = ThemeHelper()

    override func viewDidLoad() {
        super.viewDidLoad()
        setTheme()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
        setTheme()
    }


    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return pc.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotosCollectionViewCell
        
        let photoToPassToViewCell = pc.photos[indexPath.item]
        cell.photo = photoToPassToViewCell
        
        // Configure the cell
    
        return cell
    }
    
    func setTheme(){
        //check to see if themePreference has a value
        guard let setThemePreference = themeHelper.themePreference else { return }
        
        //check to see what that value is. Remember that themPreference is  computed property that could return two possible values, so we have to figure out which value it is returning
        if setThemePreference == "Dark" {
            collectionView.backgroundColor = .brown
        } else {
            collectionView.backgroundColor = .blue
        }
    }
   
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "themeSegue" {
            let destinationVC = segue.destination as! ThemeSelectionViewController
            destinationVC.themeHelper = themeHelper
        }
        
        if segue.identifier == "addSegue" {
            let destinationVC = segue.destination as! PhotoDetailViewController
            destinationVC.themeHelper = themeHelper
            destinationVC.pC = pc
        }
        
        if segue.identifier == "cellSegue" {
            //1. set the segue destination View Controller
            //2. This is a two parter: a. we cast the sender (in the function of the segue) as a uicollectionViewCell. b. we do this because we take that cell and use it to get the indexPath (type Int) to help us find the photo/item at that cell
            //3. pass the photo we've found to the destinationVC
            //4. pass the photocontroller and themehelper to the destinationVC
            
            guard let destinationVC = segue.destination as? PhotoDetailViewController, let myIndex = sender as? UICollectionViewCell, let indexPath = collectionView.indexPath(for: myIndex) else { return }
            let photoToPassToPhotoDetalViewController = pc.photos[indexPath.item]
            destinationVC.photo = photoToPassToPhotoDetalViewController
            destinationVC.pC = pc
            destinationVC.themeHelper = themeHelper
        }
     }
   
}
