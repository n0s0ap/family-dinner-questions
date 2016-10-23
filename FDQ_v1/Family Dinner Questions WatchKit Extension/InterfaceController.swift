//
//  InterfaceController.swift
//  Family Dinner Questions WatchKit Extension
//
//  Created by Ben Lew on 4/28/15.
//  Copyright (c) 2015 Ben Lew. All rights reserved.
//

import WatchKit
import Foundation




class InterfaceController: WKInterfaceController {
    @IBOutlet weak var questionSpot: WKInterfaceLabel!
   
    
    
    
    override init() {
        super.init()
        
    }
    
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func askQuestionButtonPressed() {
        
        
        let theShuffleConstant = "getTheShuffle"
        
        let appGroupID = "group.com.familydinnerquestions"
        let defaults = UserDefaults(suiteName: appGroupID)
        
       
        
        let testArray : AnyObject? = defaults!.object(forKey: theShuffleConstant) as AnyObject?
        let theQuestions : [NSString] = testArray! as! [NSString]
            
        
        
        let names = theQuestions.map { x in "page" }
        //println("\(theFive)")
        
        presentController(withNames: names, contexts: theQuestions)
    }
    
    
}
    
    
    

