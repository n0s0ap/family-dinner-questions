//
//  ViewController.swift
//  Family Dinner Questions
//
//  Created by Ben Lew on 4/27/15.
//  Copyright (c) 2015 Ben Lew. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var defaults = NSUserDefaults.standardUserDefaults()
        
        // Set a temporary time for Dinner Time if there isn't one set yet.
        if ((defaults.valueForKey("notifyMeTime")) == nil) {
            defaults.setValue(NSDate(), forKey: "notifyMeTime")
            println("oh hey, I just filled in the temp time")
        }
        
        
        // Navigation style stuff
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: nil, action: nil)
        self.navigationController?.navigationBar.translucent = true
        self.navigationController?.navigationBar.backgroundColor = UIColor(red: 0.0, green: 0.3, blue: 0.5, alpha: 0)
        let singleTap = UITapGestureRecognizer(target: self, action: "didPressStart:")
        startButton.addGestureRecognizer(singleTap)

        
        // Shuffle the cards if you haven't yet. Trying to not shuffle every single time.
        if ((defaults.stringForKey("theQuestionsDeck")) != nil) {
            println("don't shuffle")
            showCards()
        } else {
            println("I'mma need a shuffle please")
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
        var draggableViewBackground = DraggableViewBackground(frame: self.view.frame)
        self.view.addSubview(draggableViewBackground);
    }

    func didPressStart(recognizer: UITapGestureRecognizer) {
        var draggableViewBackground = DraggableViewBackground(frame: self.view.frame)
        self.view.addSubview(draggableViewBackground);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

