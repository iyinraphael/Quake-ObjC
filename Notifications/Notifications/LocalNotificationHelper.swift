//
//  LocalNotificationHelper.swift
//  Notifications
//
//  Created by Iyin Raphael on 8/8/18.
//  Copyright © 2018 Iyin Raphael. All rights reserved.
//

import Foundation
import UserNotifications

class LocalNotificationHelper : NSObject, UNUserNotificationCenterDelegate{
    
    func scheduleNotification(){
        let content = UNMutableNotificationContent()
        content.title = "Zelda game avaible now"
        content.body = "Yo, game on!"
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "lisaNotification", content: content, trigger: trigger)
        let center = UNUserNotificationCenter.current()
        
        center.delegate = self
        
        center.add(request) { (error) in
            if let error = error {
                print("There was a problem trying to schedule notifiaction, its Lisa fault \(error)")
                return
            }
        }
    }
    
    private func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        print("Notification Arrived")
        completionHandler([.alert, .sound])
        
    }
}
