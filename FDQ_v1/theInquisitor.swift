//
//  theInquisitor.swift
//  Family Dinner Questions
//
//  Created by Ben Lew on 4/28/15.
//  Copyright (c) 2015 Ben Lew. All rights reserved.
//

import Foundation



func shuffleArray<T>(var array: [T]) -> [T] {
    for index in Array((0..<array.count).reverse()) {
        let randomIndex = Int(arc4random_uniform(UInt32(index)))
        (array[index], array[randomIndex]) = (array[randomIndex], array[index])
    }
    
    return array
}

extension Array {
    
    func forEach(iterator: (Element) -> Void) -> Array {
        for item in self {
            iterator(item)
        }
        
        return self;
    }
    
}




func heyInquisitor() {
    print("The Inquisitor has been called")
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    //  PACK ONE
    let packOnepath = NSBundle.mainBundle().pathForResource("questions-basic", ofType: "plist")
    let packOneCards = NSMutableArray(contentsOfFile: packOnepath!)
    let packOneCleanCards = packOneCards as! AnyObject as! [String]

    let packOne = packOneCleanCards.map({ (packOneCleanCard) -> String in
        return packOneCleanCard.stringByAppendingString("CAT01")
    })
    //  END PACK ONE
    
    //  PACK TWO
    let packTwopath = NSBundle.mainBundle().pathForResource("questions-travel", ofType: "plist")
    let packTwoCards = NSMutableArray(contentsOfFile: packTwopath!)
    let packTwoCleanCards = packTwoCards as! AnyObject as! [String]
    
    let packTwo = packTwoCleanCards.map({ (packTwoCleanCard) -> String in
    return packTwoCleanCard.stringByAppendingString("CAT02")})
    
    //  END PACK TWO
    
    //  PACK THREE
    let packThreepath = NSBundle.mainBundle().pathForResource("questions-food", ofType: "plist")
    let packThreeCards = NSMutableArray(contentsOfFile: packThreepath!)
    let packThreeCleanCards = packThreeCards as! AnyObject as! [String]
    
    let packThree = packThreeCleanCards.map({ (packThreeCleanCard) -> String in
        return packThreeCleanCard.stringByAppendingString("CAT03")
    })
    //  END PACK THREE
    
    var mixTheQuestions = packOne
    
    //mixTheQuestions = (packOne + packTwo + packThree)
    
    if (defaults.boolForKey("purchasedPackTwo")==true){
        mixTheQuestions.appendContentsOf(packTwo)
        print("I added pack two, just fyi")
    }
    
    if (defaults.boolForKey("purchasedPackThree")==true){
        mixTheQuestions.appendContentsOf(packThree)
        print("I added pack three, just fyi")
    }
    
//    if (defaults.boolForKey("purchasedPackFour")==true){
//        let mixTheQuestions = (mixTheQuestions + packFour)
//    }
//    
//    if (defaults.boolForKey("purchasedPackFive")==true){
//        let mixTheQuestions = (mixTheQuestions + packFive)
//    }
    
    let theQuestions = shuffleArray(mixTheQuestions)
    
    
    //print("print theQuestions: \(theQuestions)")
    
    // Supporting things
    
    
    defaults.setInteger(0, forKey: "theQuestionsIndex")
    defaults.setObject(theQuestions, forKey: "theQuestionsDeck")

//    if let testArray:AnyObject? = defaults.objectForKey("theQuestionsDeck") {
//        var theSavedQuestions = testArray as AnyObject! as! [String]
//        print("the saved deck is \(theSavedQuestions)")
//    }
 
    
}