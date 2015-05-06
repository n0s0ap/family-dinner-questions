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
        //self.navigationController?.navigationBar.setBackgroundImage(UIImage(named:"translucentHeader"), forBarMetrics: UIBarMetrics.Default)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: nil, action: nil)
        self.navigationController?.navigationBar.translucent = true
        self.navigationController?.navigationBar.backgroundColor = UIColor(red: 0.0, green: 0.3, blue: 0.5, alpha: 0)
        let singleTap = UITapGestureRecognizer(target: self, action: "didPressStart:")
        startButton.addGestureRecognizer(singleTap)
        
        

        heyInquisitor()
        
        func notifyAtDinnerTime() {
            println("started the notification func")
            UIApplication.sharedApplication().cancelAllLocalNotifications()
            
            let defaults = NSUserDefaults.standardUserDefaults()
            if let dinnertime = defaults.stringForKey("notifyMeTime")
            {
                println("this is the dinnertime \(dinnertime)")
            }
            
            let theNotificationTimeFromSettings:NSDate = (NSUserDefaults.standardUserDefaults().valueForKey("notifyMeTime") as? NSDate)!
            
            var localNotification:UILocalNotification = UILocalNotification()
            localNotification.timeZone = NSTimeZone.localTimeZone()
            localNotification.alertAction = "Time for a question"
            localNotification.alertBody = "Time for a dinner question!"
            localNotification.soundName = UILocalNotificationDefaultSoundName
            localNotification.fireDate = theNotificationTimeFromSettings
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

