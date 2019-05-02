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

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addPhoto(_ sender: UIButton) {
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
