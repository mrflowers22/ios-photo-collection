//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Michael Flowers on 5/2/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    
    var themeHelper: ThemeHelper?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func selectDarkTheme(_ sender: UIButton) {
        themeHelper?.setThemePreferenceToDark()
        view.backgroundColor = .brown
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectBlueTheme(_ sender: UIButton) {
        themeHelper?.setThemePreferenceToBlue()
        view.backgroundColor = .blue
        dismiss(animated: true, completion: nil)
    }
}
