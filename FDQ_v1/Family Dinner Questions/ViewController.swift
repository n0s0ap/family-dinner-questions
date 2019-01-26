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
        
        
        
        func updateDeck(_ notification: Notification) {
            print("booyakasha")
        }
        
        func loadList(_ notification: Notification){
            //load data here
            print("let's refresh the deck!")
        }
        
        let defaults = UserDefaults.standard
     
        
        // Set a temporary time for Dinner Time if there isn't one set yet.
        if ((defaults.value(forKey: "notifyMeTime")) == nil) {
            defaults.setValue(Date(), forKey: "notifyMeTime")
            print("oh hey, I just filled in the temp time")
        }
        
        
        // Navigation style stuff
        //self.navigationController?.navigationBarHidden = true
        
        
        let logo = UIImage(named: "fdqLogo.png")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
        
        
    }
    
    func showCards() {
        let draggableViewBackground = DraggableViewBackground(frame: self.view.frame)
        self.view.addSubview(draggableViewBackground);
    }
    
    func removeCards() {
        for view in self.view.subviews{
            view.removeFromSuperview()
        }
    }

    func didPressStart(_ recognizer: UITapGestureRecognizer) {
        let draggableViewBackground = DraggableViewBackground(frame: self.view.frame)
        self.view.addSubview(draggableViewBackground);
        showCards()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidLoad()
        heyInquisitor()
        removeCards()
        showCards()
        //notifyAtDinnerTime()
        if (defaults.bool(forKey: "notifyMeSwitch")==true){
            print("The notify switch is ON")
            notifyAtDinnerTime()
        } else {
            print("The notify switch is OFF")
            UIApplication.shared.cancelAllLocalNotifications()
        }
        //print("yes, view will appear is working")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

