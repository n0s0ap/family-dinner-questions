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
    
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
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
        let defaults = NSUserDefaults(suiteName: appGroupID)
        
       
        
        let testArray : AnyObject? = defaults!.objectForKey(theShuffleConstant)
        let theQuestions : [NSString] = testArray! as! [NSString]
            
        
        
        let names = theQuestions.map { x in "page" }
        //println("\(theFive)")
        
        presentControllerWithNames(names, contexts: theQuestions)
    }
    
    
}
    
    
    

