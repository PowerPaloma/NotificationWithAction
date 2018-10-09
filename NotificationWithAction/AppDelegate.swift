//
//  AppDelegate.swift
//  NotificationWithAction
//
//  Created by Paloma Bispo on 09/10/18.
//  Copyright © 2018 Paloma Bispo. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    UNUserNotificationCenter.current().requestAuthorization(options: [.sound, .alert]) { (success, error) in
    print(error?.localizedDescription)
    }
    // Override point for customization after application launch.
    return true
    }


}


