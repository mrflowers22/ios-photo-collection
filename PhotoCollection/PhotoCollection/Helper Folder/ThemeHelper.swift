//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Steven Leyva on 5/2/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

import Foundation

class ThemeHelper {
    
    //Think of this as an address
    let themePreferenceKey = "themePreferenceKey"
    
    func setThemePreferenceToDark() {
        let userDefault = UserDefaults.standard
        
        //"Dark" is the value we can check later
        //We've just set Dark to be a resident at our address - themePreferenceKey
        userDefault.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToBlue() {
        let userDefault = UserDefaults.standard
        
        //"Blue" is the value we can check later
        //We've just set Dark to be a resident at our address -themePreferenceKey
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
