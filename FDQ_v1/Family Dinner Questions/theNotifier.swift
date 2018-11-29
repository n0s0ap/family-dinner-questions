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
    
    let questionOfftheTop = theSavedQuestions[0]
    
    let localNotification:UILocalNotification = UILocalNotification()
    localNotification.timeZone = TimeZone.autoupdatingCurrent
    localNotification.alertAction = "see more questions"
    localNotification.alertBody = "Time for a dinner question: \(questionOfftheTop)"
    localNotification.soundName = UILocalNotificationDefaultSoundName
    localNotification.fireDate = theTimeFromSettings
    localNotification.repeatInterval = NSCalendar.Unit.day
    UIApplication.shared.scheduleLocalNotification(localNotification)
    let theScheduledNotifications = UIApplication.shared.scheduledLocalNotifications
    print("the schedule is: \(String(describing: theScheduledNotifications))")
    
}
