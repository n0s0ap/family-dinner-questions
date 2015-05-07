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
    UIApplication.sharedApplication().cancelAllLocalNotifications()
    let theTimeFromSettings:NSDate! = NSUserDefaults.standardUserDefaults().valueForKey("notifyMeTime") as? NSDate!
    println("dinner time is set at \(theTimeFromSettings)")
    
    var localNotification:UILocalNotification = UILocalNotification()
    localNotification.timeZone = NSTimeZone.localTimeZone()
    localNotification.alertAction = "Time for a question"
    localNotification.alertBody = "Time for a dinner question!"
    localNotification.soundName = UILocalNotificationDefaultSoundName
    localNotification.fireDate = theTimeFromSettings
    localNotification.repeatInterval = NSCalendarUnit.CalendarUnitDay
    UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
    var theScheduledNotifications = UIApplication.sharedApplication().scheduledLocalNotifications
    println("\(theScheduledNotifications)")
    
}
