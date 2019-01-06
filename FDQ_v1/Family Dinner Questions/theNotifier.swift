//
//  theNotifier.swift
//  Family Dinner Questions
//
//  Created by Ben Lew on 5/6/15.
//  Copyright (c) 2015 Ben Lew. All rights reserved.
//

import UIKit
import Foundation

func notifyAtDinnerTime() {
    print("Updating the Notification")
    // UIApplication.sharedApplication().cancelAllLocalNotifications()
    let defaults = UserDefaults.standard
    let theTimeFromSettings:Date! = defaults.value(forKey: "notifyMeTime") as? Date
    print("dinner time is set at \(String(describing: theTimeFromSettings))")
   
    let timecomponents = Calendar.current.dateComponents([.hour, .minute], from: theTimeFromSettings)
    
    let today = Date()
    let calendar = NSCalendar.current
    let components = calendar.dateComponents([.day, .month, .year], from: today)
    
    var dateComp:DateComponents = DateComponents()
    dateComp.day = components.day
    dateComp.month = components.month
    dateComp.year = components.year
    dateComp.hour = timecomponents.hour
    dateComp.minute = timecomponents.minute
    dateComp.second = 00
    let date = calendar.date(from: dateComp)
    
    var DayOne: Date?
    DayOne = calendar.date(byAdding: .day, value: 1, to: date!)
    var DayTwo: Date?
    DayTwo = calendar.date(byAdding: .day, value: 2, to: date!)
    var DayThree: Date?
    DayThree = calendar.date(byAdding: .day, value: 3, to: date!)
    var DayFour: Date?
    DayFour = calendar.date(byAdding: .day, value: 4, to: date!)
    var DayFive: Date?
    DayFive = calendar.date(byAdding: .day, value: 5, to: date!)
    
//    EVERY MINUTE FOR TESTING
//    var DayOne: Date?
//    DayOne = calendar.date(byAdding: .minute, value: 1, to: date!)
//    var DayTwo: Date?
//    DayTwo = calendar.date(byAdding: .minute, value: 2, to: date!)
//    var DayThree: Date?
//    DayThree = calendar.date(byAdding: .minute, value: 3, to: date!)
//    var DayFour: Date?
//    DayFour = calendar.date(byAdding: .minute, value: 4, to: date!)
//    var DayFive: Date?
//    DayFive = calendar.date(byAdding: .minute, value: 5, to: date!)
    
//    let dateFormatter = DateFormatter()
//    dateFormatter.dateFormat = "dd MM yyyy hh:mm:ss"
//    let fireDate = dateFormatter.string(from: date!)
//    print("fireDate: \(fireDate)")
    
    let questionZero = theSavedQuestions[0]
    let questionOne = theSavedQuestions[1]
    let questionTwo = theSavedQuestions[2]
     let questionThree = theSavedQuestions[3]
     let questionFour = theSavedQuestions[4]
     let questionFive = theSavedQuestions[5]
    
    let NotificationZero:UILocalNotification = UILocalNotification()
    NotificationZero.timeZone = TimeZone.autoupdatingCurrent
    NotificationZero.alertAction = "see more questions"
    NotificationZero.alertBody = "Time for a dinner question: \(questionZero)"
    NotificationZero.soundName = UILocalNotificationDefaultSoundName
    NotificationZero.fireDate = date
    UIApplication.shared.scheduleLocalNotification(NotificationZero)
    
    let NotificationOne:UILocalNotification = UILocalNotification()
    NotificationOne.timeZone = TimeZone.autoupdatingCurrent
    NotificationOne.alertAction = "see more questions"
    NotificationOne.alertBody = "Time for a dinner question: \(questionOne)"
    NotificationOne.soundName = UILocalNotificationDefaultSoundName
    NotificationOne.fireDate = DayOne
    UIApplication.shared.scheduleLocalNotification(NotificationOne)
    
    let NotificationTwo:UILocalNotification = UILocalNotification()
    NotificationTwo.timeZone = TimeZone.autoupdatingCurrent
    NotificationTwo.alertAction = "see more questions"
    NotificationTwo.alertBody = "Time for a dinner question: \(questionTwo)"
    NotificationTwo.soundName = UILocalNotificationDefaultSoundName
    NotificationTwo.fireDate = DayTwo
    UIApplication.shared.scheduleLocalNotification(NotificationTwo)
    
    let NotificationThree:UILocalNotification = UILocalNotification()
    NotificationThree.timeZone = TimeZone.autoupdatingCurrent
    NotificationThree.alertAction = "see more questions"
    NotificationThree.alertBody = "Time for a dinner question: \(questionThree)"
    NotificationThree.soundName = UILocalNotificationDefaultSoundName
    NotificationThree.fireDate = DayThree
    UIApplication.shared.scheduleLocalNotification(NotificationThree)
    
    let NotificationFour:UILocalNotification = UILocalNotification()
    NotificationFour.timeZone = TimeZone.autoupdatingCurrent
    NotificationFour.alertAction = "see more questions"
    NotificationFour.alertBody = "Time for a dinner question: \(questionFour)"
    NotificationFour.soundName = UILocalNotificationDefaultSoundName
    NotificationFour.fireDate = DayFour
    UIApplication.shared.scheduleLocalNotification(NotificationFour)
    
    let NotificationFive:UILocalNotification = UILocalNotification()
    NotificationFive.timeZone = TimeZone.autoupdatingCurrent
    NotificationFive.alertAction = "see more questions"
    NotificationFive.alertBody = "Time for a dinner question: \(questionFive)"
    NotificationFive.soundName = UILocalNotificationDefaultSoundName
    NotificationFive.fireDate = DayFive
    UIApplication.shared.scheduleLocalNotification(NotificationFive)
    
    let theScheduledNotifications = UIApplication.shared.scheduledLocalNotifications
    print("the schedule is: \(String(describing: theScheduledNotifications))")
    
}
