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

extension Array {
    
    func forEach(iterator: (T) -> Void) -> Array {
        for item in self {
            iterator(item)
        }
        
        return self;
    }
    
}




func heyInquisitor() {
    println("The Inquisitor has been called")
    
    
    //  PACK ONE
    let packOnepath = NSBundle.mainBundle().pathForResource("questions-basic", ofType: "plist")
    let packOneCards = NSMutableArray(contentsOfFile: packOnepath!)
    var packOneCleanCards = packOneCards as! AnyObject as! [String]

    let packOne = packOneCleanCards.map({ (packOneCleanCard) -> String in
        return packOneCleanCard.stringByAppendingString("CAT01")
    })
    //  END PACK ONE
    
    //  PACK TWO
    let packTwopath = NSBundle.mainBundle().pathForResource("questions-travel", ofType: "plist")
    let packTwoCards = NSMutableArray(contentsOfFile: packTwopath!)
    var packTwoCleanCards = packTwoCards as! AnyObject as! [String]
    
    let packTwo = packTwoCleanCards.map({ (packTwoCleanCard) -> String in
        return packTwoCleanCard.stringByAppendingString("CAT02")
    })
    //  END PACK TWO
    
    //  PACK THREE
    let packThreepath = NSBundle.mainBundle().pathForResource("questions-food", ofType: "plist")
    let packThreeCards = NSMutableArray(contentsOfFile: packThreepath!)
    var packThreeCleanCards = packThreeCards as! AnyObject as! [String]
    
    let packThree = packThreeCleanCards.map({ (packThreeCleanCard) -> String in
        return packThreeCleanCard.stringByAppendingString("CAT03")
    })
    //  END PACK THREE
    
    let mixTheQuestions = (packOne + packTwo + packThree)
    let theQuestions = shuffleArray(mixTheQuestions)
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