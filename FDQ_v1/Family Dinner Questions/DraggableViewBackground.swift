//
//  DraggableViewBackground.swift
//  SwiftTinderCards
//
//  Created by Lukasz Gandecki on 3/23/15.
//  Copyright (c) 2015 Lukasz Gandecki. All rights reserved.
//

import Foundation
import UIKit

var defaults = UserDefaults.standard

var testArray:AnyObject? = defaults.object(forKey: "theQuestionsDeck") as AnyObject?
var theSavedQuestions = testArray as AnyObject as! [String]

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
    
    
    
    var exampleCardLabels = theSavedQuestions
    var cardsLoadedIndex = 0
    var loadedCards = NSMutableArray()
    var allCards =  NSMutableArray()
    
    var numLoadedCardsCap = 0
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        super.layoutSubviews()
        //var defaults = NSUserDefaults.standardUserDefaults()
        setLoadedCardsCap()
        createCards()
        displayCards()
        //setupView()
        
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
        let image = UIImage(named: "fdqLogo.png");
        let someOffset = self.frame.width/2-image!.size.width/2
        let imageView = UIImageView(frame: CGRect(x: someOffset, y: 20, width: image!.size.width, height: image!.size.height));
       
        imageView.image = image;
        self.addSubview(imageView);
        
    }
    
    func setBackgroundColor() {
        self.backgroundColor = UIColor(red:1.00, green:0.36, blue:0.36, alpha:1.0);
    }
    
    func addMenuButton() {
        let settingsButtonImage = UIImage(named: "buttonSettings.png")
        menuButton.frame = CGRect(x: self.frame.width-50, y: 30, width: settingsButtonImage!.size.width, height: settingsButtonImage!.size.height);
        menuButton.setImage(UIImage(named: "buttonSettings.png"), for: UIControl.State())
        addSubview(menuButton)
//        menuButton.addTarget(self, action: "didPressMenuButton:", forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    
    
    
    func addMessageButton() {
        self.messageButton.frame = CGRect(x: 284, y: 34, width: 18, height: 18)
        self.messageButton.setImage(UIImage(named: "messageButton"), for: UIControl.State())
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
            let cardFrame = CGRect(x: (self.frame.size.width - CARD_WIDTH)/2, y: (self.frame.size.height - CARD_HEIGHT)/2, width: CARD_WIDTH, height: CARD_HEIGHT)
            let UpdatedQuestionArray:AnyObject? = defaults.object(forKey: "theQuestionsDeck") as AnyObject?
            let theUpdatedSavedQuestions = UpdatedQuestionArray as AnyObject as! [String]
            
            let UpdatedQuestionLabels = theUpdatedSavedQuestions
            print("I'm going to show you \(theUpdatedSavedQuestions)")
            
            for cardLabel in UpdatedQuestionLabels {
                let stringLength = cardLabel.count
                // let substringIndex = stringLength - 5
                //let theCardCat = cardLabel.substring(from: cardLabel.characters.index(cardLabel.startIndex, offsetBy: substringIndex))
               // let stripCardCat = cardLabel.substring(to: cardLabel.characters.index(cardLabel.startIndex, offsetBy: substringIndex))
                let theCardCat = cardLabel.suffix(5)
                let stripCardCat = cardLabel.prefix(stringLength - 5)
                
                //var theCardColor = theCardCat
                let newinformation = stripCardCat
                let newCard = DraggableView(frame: cardFrame, information: String(newinformation), color: String(theCardCat))
                newCard.delegate = self;
                allCards.add(newCard)
            }
        }
    }

    func displayCards() {
        for i in stride(from: 0, to: numLoadedCardsCap, by:1) {
            loadACardAt(i)
        }
    }
    
    func cardSwipedLeft(_ card: DraggableView) {
        processCardSwipe()
    }
    
    func cardSwipedRight(_ card: DraggableView) {
        processCardSwipe()
    }

    
    func processCardSwipe() {
        //loadedCards.removeObjectAtIndex(0)
        
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
    
    func loadACardAt(_ index: Int) {
        loadedCards.add(allCards[index])
        if (loadedCards.count > 1) {
            insertSubview(loadedCards[loadedCards.count-1] as! DraggableView, belowSubview: loadedCards[loadedCards.count-2] as! DraggableView)
            // is there a way to define the array with UIView elements so I don't have to cast?
        } else {
            addSubview(loadedCards[0] as! DraggableView)
        }
        cardsLoadedIndex += 1;
        //defaults.setInteger(cardsLoadedIndex, forKey: "theQuestionsDeckIndex")
        //var readTheQuestionsIndex = defaults.integerForKey("theQuestionsDeckIndex")
        //println("cardsLoadedIndex is \(cardsLoadedIndex), theQuestionsDeckIndex is \(readTheQuestionsIndex)")
    }
    
    func swipeRight() {
        let dragView = loadedCards[0] as! DraggableView
        print ("Clicked right", terminator: "")
        dragView.rightClickAction()
    }
    
    func swipeLeft() {
        let dragView = loadedCards[0] as! DraggableView
        print ("clicked left", terminator: "")
        dragView.leftClickAction()
    }
    

    
}
