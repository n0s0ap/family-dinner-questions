//
//  OverlayView.swift
//  SwiftTinderCards
//
//  Created by Lukasz Gandecki on 3/23/15.
//  Copyright (c) 2015 Lukasz Gandecki. All rights reserved.
//

import Foundation
import UIKit

enum OverlayViewMode {
    case none
    case left
    case right
}


class OverlayView:UIView {
    var imageView = UIImageView()
    var mode = OverlayViewMode.none
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        setView()
        addImageView()
        setTheImageView("launch")
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setView() {
        self.backgroundColor = UIColor.clear
    }
    
    func addImageView() {
        setImageViewFrame()
        self.addSubview(imageView)
        
    }
    
    func setImageViewFrame() {
        imageView.frame = CGRect(x: 50, y: 50, width: 100, height: 100)

    }
    func setTheImageView(_ buttonString: String) {
        imageView.image = UIImage(named: buttonString)
    }
    
    func setMode(_ mode: OverlayViewMode) {
        setTheImageView("launch")
        if (self.mode == mode) {
            return;
        }
        
        self.mode = mode;
        
//        switch (mode) {
//        case .Left:
//            setTheImageView("noButton")
//            break;
//        case .Right:
//            setTheImageView("yesButton")
//            break;
//        case .None:
//            break;
//            
//        }
    }
    
}
