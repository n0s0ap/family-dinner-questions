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
    let defaults = NSUserDefaults.standardUserDefaults()
    let theTimeFromSettings:NSDate! = defaults.valueForKey("notifyMeTime") as? NSDate!
    print("dinner time is set at \(theTimeFromSettings)")
    
    let questionOfftheTop = theSavedQuestions[0]
    
    let localNotification:UILocalNotification = UILocalNotification()
    localNotification.timeZone = NSTimeZone.localTimeZone()
    localNotification.alertAction = "see more questions"
    localNotification.alertBody = "Time for a dinner question: \(questionOfftheTop)"
    localNotification.soundName = UILocalNotificationDefaultSoundName
    localNotification.fireDate = theTimeFromSettings
    localNotification.repeatInterval = NSCalendarUnit.Day
    UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
    let theScheduledNotifications = UIApplication.sharedApplication().scheduledLocalNotifications
    print("the schedule is: \(theScheduledNotifications)")
    
}
