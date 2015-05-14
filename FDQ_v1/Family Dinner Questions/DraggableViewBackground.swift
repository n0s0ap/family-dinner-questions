//
//  DraggableViewBackground.swift
//  SwiftTinderCards
//
//  Created by Lukasz Gandecki on 3/23/15.
//  Copyright (c) 2015 Lukasz Gandecki. All rights reserved.
//

import Foundation
import UIKit

var defaults = NSUserDefaults.standardUserDefaults()

let testArray:AnyObject? = defaults.objectForKey("theQuestionsDeck")
var theSavedQuestions = testArray as AnyObject! as! [String]

// var cardsLoadedIndex = defaults.integerForKey("theQuestionsDeckIndex")

//println("the saved deck is \(theSavedQuestions)")

class DraggableViewBackground: UIView, DraggableViewDelegate {
    
    let MAX_BUFFER_SIZE = 2;
    let CARD_HEIGHT = CGFloat(386.0);
    let CARD_WIDTH = CGFloat(290.0);
    
    let menuButton = UIButton()
    let messageButton = UIButton()
    let checkButton = UIButton()
    let xButton = UIButton()
    
    
    
    let exampleCardLabels = theSavedQuestions
    var cardsLoadedIndex = 0
    var loadedCards = NSMutableArray()
    var allCards =  NSMutableArray()
    
    var numLoadedCardsCap = 0
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        super.layoutSubviews()
        var defaults = NSUserDefaults.standardUserDefaults()
        
        //setupView()
        setLoadedCardsCap()
        createCards()
        displayCards()
    }
    
   func setupView() {
//        setBackgroundColor()
addMenuButton()
       //addMessageButton()
////        addXButton()
////        addCheckButton()
//        addLogo()
   }

    
    func addLogo() {
         var image = UIImage(named: "fdqLogo.png");
        var someOffset = self.frame.width/2-image!.size.width/2
        var imageView = UIImageView(frame: CGRectMake(someOffset, 20, image!.size.width, image!.size.height));
       
        imageView.image = image;
        self.addSubview(imageView);
        
    }
    
    func setBackgroundColor() {
        self.backgroundColor = UIColor(red:0.949, green:0.22, blue:0.353, alpha:1);
    }
    
    func addMenuButton() {
        var settingsButtonImage = UIImage(named: "buttonSettings.png")
        menuButton.frame = CGRectMake(self.frame.width-50, 30, settingsButtonImage!.size.width, settingsButtonImage!.size.height);
        menuButton.setImage(UIImage(named: "buttonSettings.png"), forState: .Normal)
        addSubview(menuButton)
        menuButton.addTarget(self, action: "didPressMenuButton:", forControlEvents: UIControlEvents.TouchUpInside)
    }
    
 
    
    
    func addMessageButton() {
        self.messageButton.frame = CGRectMake(284, 34, 18, 18)
        self.messageButton.setImage(UIImage(named: "messageButton"), forState: .Normal)
        self.addSubview(messageButton)
    }
//
//    func addXButton() {
//        xButton.frame = CGRectMake(60, 485, 59, 59)
//        xButton.setImage(UIImage(named: "xButton"), forState: .Normal)
//        xButton.addTarget(self, action: "swipeLeft", forControlEvents: .TouchUpInside)
//        addSubview(xButton)
//    }
//    
//    func addCheckButton() {
//        checkButton.frame = CGRectMake(200, 485, 59, 59)
//        checkButton.setImage(UIImage(named: "checkButton"), forState: .Normal)
//        checkButton.addTarget(self, action: "swipeRight",
//            forControlEvents: .TouchUpInside)
//        addSubview(checkButton)
//    }
    
    func setLoadedCardsCap() {
        numLoadedCardsCap = 0;
        if (exampleCardLabels.count > MAX_BUFFER_SIZE) {
            numLoadedCardsCap = MAX_BUFFER_SIZE
        } else {
            numLoadedCardsCap = exampleCardLabels.count
        }
        
    }
    
    func createCards() {
        if (numLoadedCardsCap > 0) {
            let cardFrame = CGRectMake((self.frame.size.width - CARD_WIDTH)/2, (self.frame.size.height - CARD_HEIGHT)/2, CARD_WIDTH, CARD_HEIGHT)
            
            for cardLabel in exampleCardLabels {
                let stringLength = count(cardLabel)
                let substringIndex = stringLength - 5
                let theCardCat = cardLabel.substringFromIndex(advance(cardLabel.startIndex, substringIndex))
                let stripCardCat = cardLabel.substringToIndex(advance(cardLabel.startIndex, substringIndex))
                var theCardColor = theCardCat
                var newinformation = stripCardCat
                var newCard = DraggableView(frame: cardFrame, information: newinformation, color: theCardCat)
                println("from the createcards function theCardCat=\(theCardCat)")
                newCard.delegate = self;
                allCards.addObject(newCard)
            }
        }
    }

    func displayCards() {
        for(var i = 0; i < numLoadedCardsCap; i++) {
            loadACardAt(i)
        }
    }
    
    func cardSwipedLeft(card: DraggableView) {
        processCardSwipe()
    }
    
    func cardSwipedRight(card: DraggableView) {
        processCardSwipe()
    }

    
    func processCardSwipe() {
        loadedCards.removeObjectAtIndex(0)
        
        if (moreCardsToLoad()) {
            loadNextCard()
            
        } 
    }
    
    func moreCardsToLoad() -> Bool {
        return cardsLoadedIndex < allCards.count-1;
    }
    
    func loadNextCard() {
        loadACardAt(cardsLoadedIndex)
    }
    
    func loadACardAt(index: Int) {
        loadedCards.addObject(allCards[index])
        if (loadedCards.count > 1) {
            insertSubview(loadedCards[loadedCards.count-1] as! DraggableView, belowSubview: loadedCards[loadedCards.count-2] as! DraggableView)
            // is there a way to define the array with UIView elements so I don't have to cast?
        } else {
            addSubview(loadedCards[0] as! DraggableView)
        }
        cardsLoadedIndex++;
        //defaults.setInteger(cardsLoadedIndex, forKey: "theQuestionsDeckIndex")
        //var readTheQuestionsIndex = defaults.integerForKey("theQuestionsDeckIndex")
        //println("cardsLoadedIndex is \(cardsLoadedIndex), theQuestionsDeckIndex is \(readTheQuestionsIndex)")
    }
    
    func swipeRight() {
        let dragView = loadedCards[0] as! DraggableView
        print ("Clicked right")
        dragView.rightClickAction()
    }
    
    func swipeLeft() {
        let dragView = loadedCards[0] as! DraggableView
        print ("clicked left")
        dragView.leftClickAction()
    }
    

    
}