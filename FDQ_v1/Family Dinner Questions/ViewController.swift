//
//  ViewController.swift
//  Family Dinner Questions
//
//  Created by Ben Lew on 4/27/15.
//  Copyright (c) 2015 Ben Lew. All rights reserved.
//

import UIKit

let theDeckHasUpdatedKey = "com.n0s0ap.familydinnerquestions.theDeckHasUpdated"

class ViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "updateDeck", name: "theDeckHasUpdatedKey", object: nil)
        
        
        func updateDeck(notification: NSNotification) {
            print("booyakasha")
        }
        
        func loadList(notification: NSNotification){
            //load data here
            print("let's refresh the deck!")
        }
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        // Set a temporary time for Dinner Time if there isn't one set yet.
        if ((defaults.valueForKey("notifyMeTime")) == nil) {
            defaults.setValue(NSDate(), forKey: "notifyMeTime")
            print("oh hey, I just filled in the temp time")
        }
        
        
        // Navigation style stuff
        //self.navigationController?.navigationBarHidden = true
        
        
        let logo = UIImage(named: "fdqLogo.png")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
        //self.navigationController?.navigationBar.translucent = true
        self.navigationController?.navigationBar.barTintColor = UIColor(red:0.95, green:0.22, blue:0.35, alpha:1.0)
     
        
        let singleTap = UITapGestureRecognizer(target: self, action: "didPressStart:")
        startButton.addGestureRecognizer(singleTap)

        
        // Shuffle the cards if you haven't yet. Trying to not shuffle every single time.
        if ((defaults.stringForKey("theQuestionsDeck")) != nil) {
            print("don't shuffle")
            showCards()
        } else {
            print("I'mma need a shuffle please")
            heyInquisitor()
            showCards()
        }

        if (defaults.boolForKey("notifyMeSwitchState")==true){
            notifyAtDinnerTime()
        } else {
            UIApplication.sharedApplication().cancelAllLocalNotifications()
        }
    }
    
    func showCards() {
        let draggableViewBackground = DraggableViewBackground(frame: self.view.frame)
        self.view.addSubview(draggableViewBackground);
    }

    func didPressStart(recognizer: UITapGestureRecognizer) {
        let draggableViewBackground = DraggableViewBackground(frame: self.view.frame)
        self.view.addSubview(draggableViewBackground);
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

