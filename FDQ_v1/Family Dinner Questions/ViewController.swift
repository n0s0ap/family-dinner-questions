//
//  ViewController.swift
//  Family Dinner Questions
//
//  Created by Ben Lew on 4/27/15.
//  Copyright (c) 2015 Ben Lew. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named:"translucentHeader"), forBarMetrics: UIBarMetrics.Default)
        
        self.navigationController?.navigationBar.barStyle = UIBarStyle.Black
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: nil, action: nil)
        
        var draggableViewBackground = DraggableViewBackground(frame: self.view.frame)
        self.view.addSubview(draggableViewBackground);

        heyInquisitor()
        func notifyAtDinnerTime() {
            println("started the notification func")
            UIApplication.sharedApplication().cancelAllLocalNotifications()
            
            
            
            
//           NSDate *d = [calendar dateBySettingHour:17 minute:0 second:0 ofDate:[NSDate date] options:0];
//            
//            dinnerTime = NSDate(coder: now)
            
            var localNotification:UILocalNotification = UILocalNotification()
            localNotification.timeZone = NSTimeZone.localTimeZone()
            localNotification.alertAction = "Time for a question"
            localNotification.alertBody = "Time for a dinner question!"
            localNotification.soundName = UILocalNotificationDefaultSoundName
            localNotification.fireDate = NSDate(timeIntervalSinceNow: 5)
            localNotification.repeatInterval = NSCalendarUnit.CalendarUnitDay
            UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
            var theScheduledNotifications = UIApplication.sharedApplication().scheduledLocalNotifications
            
            
            println("\(theScheduledNotifications)")

        }
        
        notifyAtDinnerTime()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

