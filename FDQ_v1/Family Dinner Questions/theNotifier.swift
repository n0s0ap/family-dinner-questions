//
//  theNotifier.swift
//  Family Dinner Questions
//
//  Created by Ben Lew on 5/6/15.
//  Copyright (c) 2015 Ben Lew. All rights reserved.
//

import UIKit
import Foundation
import UserNotifications

func userNotificationCenter(_ center:UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
    completionHandler([.alert, .sound])
}



func notificationSetup() {
   
    
    let defaults = UserDefaults.standard
    let theTimeFromSettings:Date! = defaults.value(forKey: "notifyMeTime") as? Date
    print("dinner time is set at \(String(describing: theTimeFromSettings))")
    
    //let timecomponents = Calendar.current.dateComponents([.hour, .minute], from: theTimeFromSettings)

    
//    let today = Date()
//    let calendar = NSCalendar.current
//    let components = calendar.dateComponents([.day, .month, .year], from: today)
//    let componentsTwo = calendar.date(byAdding: .minute, value: 1, to: today)
//
//    var dateComp:DateComponents = DateComponents()
//    dateComp.day = components.day
//    dateComp.month = components.month
//    dateComp.year = components.year
//    dateComp.hour = timecomponents.hour
//    dateComp.minute = timecomponents.minute
//    dateComp.second = 00
//    let date = calendar.date(from: dateComp)
//
//    var dateCompTwo:DateComponents = DateComponents()
//    dateCompTwo.day = components.day
//    dateCompTwo.month = components.month
//    dateCompTwo.year = components.year
//    dateCompTwo.hour = timecomponents.hour
//    dateCompTwo.minute = 2
//    dateCompTwo.second = 00
//    let dateTwo = calendar.date(from: dateCompTwo)
//
//    let dateFormatter = DateFormatter()
//    dateFormatter.dateFormat = "dd MM yyyy hh:mm:ss"
//    let fireDate = dateFormatter.string(from: date!)
//    print("fireDate: \(fireDate)")
//
//
//    let localNotification:UILocalNotification = UILocalNotification()
//    localNotification.timeZone = TimeZone.autoupdatingCurrent
//    localNotification.alertAction = "see more questions"
//    localNotification.alertBody = "Time for a dinner Q: \(theSavedQuestions[0])"
//    localNotification.soundName = UILocalNotificationDefaultSoundName
//    localNotification.fireDate = date
//    //localNotification.repeatInterval = .minute
//
//    let localNotificationTwo:UILocalNotification = UILocalNotification()
//    localNotificationTwo.timeZone = TimeZone.autoupdatingCurrent
//    localNotificationTwo.alertAction = "see more questions"
//    localNotificationTwo.alertBody = "Time for a dinner Q: \(theSavedQuestions[1])"
//    localNotificationTwo.soundName = UILocalNotificationDefaultSoundName
//    localNotificationTwo.fireDate = dateTwo
  
    //localNotification.fireDate = theTimeFromSettings
    // localNotification.repeatInterval = NSCalendar.Unit.day
    
    
//    UIApplication.shared.scheduleLocalNotification(localNotification)
//    UIApplication.shared.scheduleLocalNotification(localNotificationTwo)
//    let theScheduledNotifications = UIApplication.shared.scheduledLocalNotifications
//    print("the schedule is: \(String(describing: theScheduledNotifications))")
//
//
    
    
    
    if #available(iOS 10.0, *) {
         UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        print("hi from the new notification thing")
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert, .sound])
        { (granted, error) in
            let notificationTitle = "Time for a dinner question"
            
            //        Notification DayOne
            let contentDayOne = UNMutableNotificationContent.init()
            contentDayOne.title = notificationTitle
            contentDayOne.body = "\(theSavedQuestions[0])"
            contentDayOne.sound = UNNotificationSound.default
            let identifierDayOne = "DayOne"
            var dateComponentsDayOne = Calendar.current.dateComponents([.hour, .minute], from: theTimeFromSettings)
            dateComponentsDayOne.day = 0
            let triggerDayOne = UNCalendarNotificationTrigger.init(dateMatching: dateComponentsDayOne, repeats: false)
            let requestDayOne = UNNotificationRequest.init(identifier: identifierDayOne, content: contentDayOne, trigger: triggerDayOne)
            UNUserNotificationCenter.current().add(requestDayOne, withCompletionHandler: nil)
            
            center.add(requestDayOne) { (error) in
                if error != nil {
                    print("Failed")
                } else {
                    print("Success")
                }
            }
            //        End Notification DayOne
            
            //        Notification DayTwo
            let contentDayTwo = UNMutableNotificationContent.init()
            contentDayTwo.title = notificationTitle
            contentDayTwo.body = "\(theSavedQuestions[1])"
            let identifierDayTwo = "DayTwo"
            var dateComponentsDayTwo = Calendar.current.dateComponents([.hour, .minute], from: theTimeFromSettings)
            dateComponentsDayTwo.day = 1
            let triggerDayTwo = UNCalendarNotificationTrigger.init(dateMatching: dateComponentsDayTwo, repeats: false)
            let requestDayTwo = UNNotificationRequest.init(identifier: identifierDayTwo, content: contentDayTwo, trigger: triggerDayTwo)
            
            center.add(requestDayTwo) { (error) in
                if error != nil {
                    print("Failed")
                } else {
                    print("Success")
                }
            }
            //        End Notification DayTwo
            
            //        Notification DayThree
            let contentDayThree = UNMutableNotificationContent.init()
            contentDayThree.title = notificationTitle
            contentDayThree.body = "\(theSavedQuestions[2])"
            let identifierDayThree = "DayThree"
            var dateComponentsDayThree = Calendar.current.dateComponents([.hour, .minute], from: theTimeFromSettings)
            dateComponentsDayThree.day = 2
            let triggerDayThree = UNCalendarNotificationTrigger.init(dateMatching: dateComponentsDayThree, repeats: false)
            let requestDayThree = UNNotificationRequest.init(identifier: identifierDayThree, content: contentDayThree, trigger: triggerDayThree)
            
            center.add(requestDayThree) { (error) in
                if error != nil {
                    print("Failed")
                } else {
                    print("Success")
                }
            }
            //        End Notification DayThree
            
            //        Notification DayFour
            let contentDayFour = UNMutableNotificationContent.init()
            contentDayFour.title = notificationTitle
            contentDayFour.body = "\(theSavedQuestions[3])"
            let identifierDayFour = "DayFour"
            var dateComponentsDayFour = Calendar.current.dateComponents([.hour, .minute], from: theTimeFromSettings)
            dateComponentsDayFour.day = 3
            let triggerDayFour = UNCalendarNotificationTrigger.init(dateMatching: dateComponentsDayFour, repeats: false)
            let requestDayFour = UNNotificationRequest.init(identifier: identifierDayFour, content: contentDayFour, trigger: triggerDayFour)
            
            center.add(requestDayFour) { (error) in
                if error != nil {
                    print("Failed")
                } else {
                    print("Success")
                }
            }
            //        End Notification DayFour
            
            //        Notification DayFive
            let contentDayFive = UNMutableNotificationContent.init()
            contentDayFive.title = notificationTitle
            contentDayFive.body = "\(theSavedQuestions[4])"
            let identifierDayFive = "DayFive"
            var dateComponentsDayFive = Calendar.current.dateComponents([.hour, .minute], from: theTimeFromSettings)
            dateComponentsDayFive.day = 4
            let triggerDayFive = UNCalendarNotificationTrigger.init(dateMatching: dateComponentsDayFive, repeats: false)
            let requestDayFive = UNNotificationRequest.init(identifier: identifierDayFive, content: contentDayFive, trigger: triggerDayFive)
            
            center.add(requestDayFive) { (error) in
                if error != nil {
                    print("Failed")
                } else {
                    print("Success")
                }
            }
            //        End Notification DayFive
            
            center.getPendingNotificationRequests(completionHandler: { requests in
                for request in requests {
                    print(request)
                }
            })
        }
        
       
        
    } else {
        // Fallback on earlier versions
    }
    
    
}

//func notifyAtDinnerTime() {
//    print("Updating the Notification")
//    // UIApplication.sharedApplication().cancelAllLocalNotifications()
//    let defaults = UserDefaults.standard
//    let theTimeFromSettings:Date! = defaults.value(forKey: "notifyMeTime") as? Date
//    print("dinner time is set at \(String(describing: theTimeFromSettings))")
//
//    let timecomponents = Calendar.current.dateComponents([.hour, .minute], from: theTimeFromSettings)
//
//    let today = Date()
//    let calendar = NSCalendar.current
//    let components = calendar.dateComponents([.day, .month, .year], from: today)
//
//    var dateComp:DateComponents = DateComponents()
//    dateComp.day = components.day
//    dateComp.month = components.month
//    dateComp.year = components.year
//    dateComp.hour = timecomponents.hour
//    dateComp.minute = timecomponents.minute
//    dateComp.second = 00
//    let date = calendar.date(from: dateComp)
//
//    let dateFormatter = DateFormatter()
//    dateFormatter.dateFormat = "dd MM yyyy hh:mm:ss"
//    let fireDate = dateFormatter.string(from: date!)
//    print("fireDate: \(fireDate)")
//
//    //let questionOfftheTop = theSavedQuestions[0]
//    //let RandomQuestion = Int(arc4random_uniform(UInt32(theSavedQuestions.count)))
//
//    let localNotification:UILocalNotification = UILocalNotification()
//    localNotification.timeZone = TimeZone.autoupdatingCurrent
//    localNotification.alertAction = "see more questions"
//    localNotification.alertBody = "Time for a dinner Q: \(theSavedQuestions[0])"
//    localNotification.soundName = UILocalNotificationDefaultSoundName
//    localNotification.fireDate = date
//    // localNotification.repeatInterval = .minute
//    // localNotification.fireDate = theTimeFromSettings
//    // localNotification.repeatInterval = NSCalendar.Unit.day
//    UIApplication.shared.scheduleLocalNotification(localNotification)
//    let theScheduledNotifications = UIApplication.shared.scheduledLocalNotifications
//    print("the schedule is: \(String(describing: theScheduledNotifications))")
//
//}
