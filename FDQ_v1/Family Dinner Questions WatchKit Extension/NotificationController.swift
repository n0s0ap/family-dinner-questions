//
//  NotificationController.swift
//  Family Dinner Questions WatchKit Extension
//
//  Created by Ben Lew on 4/28/15.
//  Copyright (c) 2015 Ben Lew. All rights reserved.
//

import WatchKit
import Foundation


class NotificationController: WKUserNotificationInterfaceController {

    @IBOutlet weak var questionMessage: WKInterfaceLabel!
    override init() {
        // Initialize variables here.
        super.init()
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
  
    
  
//    override func didReceiveLocalNotification(localNotification: UILocalNotification, withCompletion completionHandler: ((WKUserNotificationInterfaceType) -> Void)) {
//        // This method is called when a local notification needs to be presented.
//        // Implement it if you use a dynamic notification interface.
//        // Populate your dynamic notification interface as quickly as possible.
//        //
//        // After populating your dynamic notification interface call the completion block.
//
//        questionMessage.setText("this be static!")
//        completionHandler(.Custom)
//    }
   
    
//  
//    override func didReceiveRemoteNotification(remoteNotification: [NSObject : AnyObject], withCompletion completionHandler: ((WKUserNotificationInterfaceType) -> Void)) {
//        // This method is called when a remote notification needs to be presented.
//        // Implement it if you use a dynamic notification interface.
//        // Populate your dynamic notification interface as quickly as possible.
//        //
//        // After populating your dynamic notification interface call the completion block.
//        questionMessage.setText("hello")
//        completionHandler(.Custom)
//    }

}
