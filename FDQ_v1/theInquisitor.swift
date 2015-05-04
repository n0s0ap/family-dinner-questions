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

let array = ["a", "b", "c", "d"]


let path = NSBundle.mainBundle().pathForResource("questions-basic", ofType: "plist")
let dict = NSMutableArray(contentsOfFile: path!)



var theNotshuffledQuestions = dict as! AnyObject as! [String]
let theQuestions = shuffleArray(theNotshuffledQuestions)
//let theQuestions = ["a", "b", "c", "d"]


func heyInquisitor() {
    let path = NSBundle.mainBundle().pathForResource("questions-basic", ofType: "plist")
    let theCards = NSMutableArray(contentsOfFile: path!)
    var theCleanCards = theCards as! AnyObject as! [String]
    let theQuestions = shuffleArray(theCleanCards)
    // println("print theQuestions: \(theQuestions)")
    
    
    // Save the shuffle
    let theQuestionsTryHard: AnyObject
    
    var array1: [NSString] = [NSString]()
    array1.append("value 1")
    array1.append("value 2")
    
    theQuestionsTryHard = array1
    
    let theShuffleConstant = "getTheShuffle"
    let appGroupID = "group.com.familydinnerquestions"
    let defaults = NSUserDefaults(suiteName: appGroupID)
    defaults!.setObject(theQuestions, forKey:theShuffleConstant)
    
    
    defaults!.synchronize()
    // Test the Shuffle save
    if let testArray : AnyObject? = defaults!.objectForKey(theShuffleConstant) {
        var readArray : [NSString] = testArray!as! [NSString]
        // println("the saved shuffle is: \(readArray)")
    }
    
    
    
}