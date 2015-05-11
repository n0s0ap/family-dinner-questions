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
    println("Updating the Notification")
    // UIApplication.sharedApplication().cancelAllLocalNotifications()
    var defaults = NSUserDefaults.standardUserDefaults()
    let theTimeFromSettings:NSDate! = defaults.valueForKey("notifyMeTime") as? NSDate!
    println("dinner time is set at \(theTimeFromSettings)")
    
    var questionOfftheTop = theSavedQuestions[0]
    
    var localNotification:UILocalNotification = UILocalNotification()
    localNotification.timeZone = NSTimeZone.localTimeZone()
    localNotification.alertAction = "see more questions"
    localNotification.alertBody = "Time for a dinner question: \(questionOfftheTop)"
    localNotification.soundName = UILocalNotificationDefaultSoundName
    localNotification.fireDate = theTimeFromSettings
    localNotification.repeatInterval = NSCalendarUnit.CalendarUnitDay
    UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
    var theScheduledNotifications = UIApplication.sharedApplication().scheduledLocalNotifications
    println("the schedule is: \(theScheduledNotifications)")
    
}
