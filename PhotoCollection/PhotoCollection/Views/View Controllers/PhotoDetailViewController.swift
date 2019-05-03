//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Michael Flowers on 5/2/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    var pC: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }
    
    @IBAction func addPhoto(_ sender: UIButton) {
        //create an instance of imagePickerController
        let imagePickerController = UIImagePickerController()
        
        //set the delegate to this view controller
        imagePickerController.delegate = self
        
        //set rules for picker controller
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.allowsEditing = false
        
        //present the view-pickerController
        present(imagePickerController, animated: true, completion: nil)
       
    }
    
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        
        //check to see if photo was passed in
        guard let passedInPhoto = photo else {
            //theres not a photo already so i have to create an instance of a photo
            //check photoImageView.image, convert that into DATA, check to see if there is text in the title textField - we need this information to create photo
            if let photoImage = imageView.image, let imageData = photoImage.pngData(), let title = textField.text, !title.isEmpty  {
                pC?.create(photoWith: imageData, and: title)
            }
            //pop navigation controller
            navigationController?.popToRootViewController(animated: true)
            return }
  
        //anythng after the return means that there is a photo or photo != nil so we have to update the photo
        pC?.update(photo: passedInPhoto, with: passedInPhoto.imageData, and: passedInPhoto.title)
        
        }
    
    
    func setTheme(){
        //checking to see if a theme was set
        guard let currentTheme = themeHelper?.themePreference else { return }
        
        //now that a theme was set we have to change the background color to match said theme
//        if currentTheme == "Blue" {
//            view.backgroundColor = .blue
//        } else {
//            view.backgroundColor = .brown
//        }
        
        //the above if statement works the same I just wanted to use a switch statement.
        switch currentTheme {
        case "Blue":
            view.backgroundColor = .blue
        case "Dark":
            view.backgroundColor = .brown
        default:
            view.backgroundColor = .yellow
        }
    }
    
    func updateViews(){
        setTheme()
        
        guard let passedInPhoto = photo, let image = UIImage(data: passedInPhoto.imageData) else { return }
        imageView.image = image
        textField.text = passedInPhoto.title
        title = passedInPhoto.title
    }
}

extension PhotoDetailViewController:  UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        //make sure user selected an image
        if let photoSelected = info[.originalImage] as? UIImage {
            imageView.image = photoSelected
        } else {
            print("There was a problem getting the image")
        }
        dismiss(animated: true, completion: nil)
    }
    
}
