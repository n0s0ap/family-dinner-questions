//
//  PageInterfaceController.swift
//  fdq
//
//  Created by Ben Lew on 4/27/15.
//  Copyright (c) 2015 Ben Lew. All rights reserved.
//

import WatchKit
import Foundation


class PageInterfaceController: WKInterfaceController {
    
    var page: String?
    
    @IBOutlet weak var theQuestionCard: WKInterfaceLabel!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        if let number = context as? String {
            self.page = number
            theQuestionCard.setText("\(number)")
        }
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
}
