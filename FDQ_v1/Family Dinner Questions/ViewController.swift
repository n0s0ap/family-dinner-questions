//
//  ViewController.swift
//  Family Dinner Questions
//
//  Created by Ben Lew on 4/27/15.
//  Copyright (c) 2015 Ben Lew. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named:"translucentHeader"), forBarMetrics: UIBarMetrics.Default)
        
        self.navigationController?.navigationBar.barStyle = UIBarStyle.Black
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: nil, action: nil)
        
        let singleTap = UITapGestureRecognizer(target: self, action: "didPressStart:")
        startButton.addGestureRecognizer(singleTap)
        
        

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

    func didPressStart(recognizer: UITapGestureRecognizer) {
        var draggableViewBackground = DraggableViewBackground(frame: self.view.frame)
        self.view.addSubview(draggableViewBackground);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

