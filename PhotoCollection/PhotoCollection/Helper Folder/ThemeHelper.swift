//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Steven Leyva on 5/2/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

import Foundation

class ThemeHelper {
    let themePreferenceKey = "themePreferenceKey"
    
    func setThemePreferenceToDark() {
        let userDefault = UserDefaults.standard
        userDefault.set("Dark", forKey: themePreferenceKey)
    }
    func setThemePreferenceToBlue() {
        let userDefault = UserDefaults.standard
        userDefault.set("Blue", forKey: themePreferenceKey)
    }
    var themePreference: String? {
        
       return UserDefaults.standard.string(forKey: themePreferenceKey)
        
        
        
        
    }
    init() {
        if themePreference == nil {
            setThemePreferenceToDark()
        } 
}

}
