//
//  ViewController.swift
//  NotificationWithVideo
//
//  Created by Paloma Bispo on 08/10/18.
//  Copyright © 2018 Paloma Bispo. All rights reserved.
//

import UIKit
import UserNotifications
class ViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UNUserNotificationCenter.current().delegate = self
        
        handleNotification(title: "This is a notification", body: "cool notification")
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let identifier = response.actionIdentifier
        
        switch identifier {
        case "answer":
            print("do something")
            
        case "color":
            print("do something")
        
        case "emoji":
            print("do something")
            
        default:
            print("defalut")
        }
        completionHandler()
    }
    
    func handleNotification(title: String, body: String){
        let content = UNMutableNotificationContent()
        
        
        let anwserAction = UNNotificationAction(identifier: "answer", title: "Answer", options: [])
        let changeColorAction = UNNotificationAction(identifier: "color", title: "Change Color View", options: [])
        let emojiAction = UNNotificationAction(identifier: "emoji", title: "👍🏽", options: [])
        
        
        
        let category = UNNotificationCategory(identifier: "category", actions: [anwserAction, changeColorAction, emojiAction ], intentIdentifiers: [], options: [])
        guard let url = Bundle.main.url(forResource: "image", withExtension: "jpg") else {return}
        guard let attachment = try? UNNotificationAttachment(identifier: UUID().uuidString, url: url, options: nil) else {return}
        
        
        content.title = title
        content.body = body
        content.sound = UNNotificationSound.default
        content.categoryIdentifier = "category"
        content.attachments = [attachment]
        
        
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().setNotificationCategories([category])
        
        UNUserNotificationCenter.current().add(request) { (error) in
            print(error?.localizedDescription)
        }
        
    }
    
}

extension ViewController: UNUserNotificationCenterDelegate{
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        completionHandler([.alert, .sound, .badge])
    }
}

