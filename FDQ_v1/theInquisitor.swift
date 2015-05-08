//
//  theInquisitor.swift
//  Family Dinner Questions
//
//  Created by Ben Lew on 4/28/15.
//  Copyright (c) 2015 Ben Lew. All rights reserved.
//

import Foundation



func shuffleArray<T>(var array: [T]) -> [T] {
    for index in reverse(0..<array.count) {
        let randomIndex = Int(arc4random_uniform(UInt32(index)))
        (array[index], array[randomIndex]) = (array[randomIndex], array[index])
    }
    
    return array
}


func heyInquisitor() {
    println("The Inquisitor has been called")
    let path = NSBundle.mainBundle().pathForResource("questions-basic", ofType: "plist")
    let theCards = NSMutableArray(contentsOfFile: path!)
    var theCleanCards = theCards as! AnyObject as! [String]
    let theQuestions = shuffleArray(theCleanCards)
    println("print theQuestions: \(theQuestions)")
    
    
    // Supporting things
    
    var defaults = NSUserDefaults.standardUserDefaults()
    defaults.setInteger(0, forKey: "theQuestionsIndex")
    defaults.setObject(theQuestions, forKey: "theQuestionsDeck")
//    let theSavedQuestions:NSString! = defaults.stringForKey("theQuestionsDeck")

    if let testArray:AnyObject? = defaults.objectForKey("theQuestionsDeck") {
        var theSavedQuestions = testArray as AnyObject! as! [String]
        //println("the saved deck is \(theSavedQuestions)")
    }
    
    

    
    
    
}