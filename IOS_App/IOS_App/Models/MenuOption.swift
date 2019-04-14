//
//  MenuOption.swift
//  IOS_App
//
//  Created by Ana Maria Novoa Ramos on 14/04/2019.
//  Copyright © 2019 Ana Maria Novoa Ramos. All rights reserved.
//

import UIKit

enum MenuOption: Int, CustomStringConvertible{
    case Profile
    case Inbox
    case Notification
    case Settings
    
    var description: String {
        switch self {
        case .Profile: return "Profile"
        case .Inbox: return "Inbox"
        case .Notification: return "Notification"
        case .Settings: return "Settings"
            
        }
    }
    var image: UIImage {
        switch self {
        case .Profile: return UIImage(named:"ic_person_outline_white_2x") ?? UIImage()
        case .Inbox: return UIImage(named:"ic_mail_outline_white_2x") ?? UIImage()
        case .Notification: return UIImage(named:"ic_menu_white_3x") ?? UIImage()
        case .Settings: return UIImage(named:"baseline_settings_white_24dp") ?? UIImage()
    
    }
  }
}
