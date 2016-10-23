//
//  DraggableView.swift
//  SwiftTinderCards
//
//  Created by Lukasz Gandecki on 3/23/15.
//  Copyright (c) 2015 Lukasz Gandecki. All rights reserved.
//

import Foundation
import UIKit

let ACTION_MARGIN = CGFloat(120) //%%% distance from center where the action applies. Higher = swipe further in order for the action to be called
let SCALE_STRENGTH = CGFloat(4) //%%% how quickly the card shrinks. Higher = slower shrinking
let SCALE_MAX = CGFloat(0.93) //%%% upper bar for how much the card shrinks. Higher = shrinks less
let ROTATION_MAX = CGFloat(1) //%%% the maximum rotation allowed in radians.  Higher = card can keep rotating longer
let ROTATION_STRENGTH = CGFloat(320) //%%% strength of rotation. Higher = weaker rotation
let ROTATION_ANGLE = CGFloat(M_PI/8) //%%% Higher = stronger rotation angle


class DraggableView:UIView{
    var delegate:DraggableViewDelegate?
    
    var xFromCenter = CGFloat()
    var yFromCenter = CGFloat()
    
    var originalPoint = CGPoint()
    
    var information = UILabel()
    //var questionColor = UIColor()
    
    var panGestureRecognizer = UIPanGestureRecognizer()
    
    var overlayView:OverlayView?
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    convenience init(frame: CGRect, information: String, color: String) {
        self.init(frame: frame)
        setupView()
        addOverlayView()
        addGestureRecognizer()
        setTheInformation(information, color: color)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupView() {
        
        self.backgroundColor = UIColor.white
        self.layer.cornerRadius = 6;
        self.layer.shadowRadius = 6;
        self.layer.shadowOpacity = 0.1;
        self.layer.shadowOffset = CGSize(width: 1, height: 1);
        
        
    }
   
    
    func addOverlayView() {
        let overlayViewFrame = CGRect(x: self.frame.size.width/2-100, y: 0, width: 100, height: 100)
        overlayView = OverlayView(frame: overlayViewFrame)
        addSubview(overlayView!)
    }

    func addGestureRecognizer() {
        panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(DraggableView.beingDragged(_:)))
        self.addGestureRecognizer(panGestureRecognizer)
    }
    
    func beingDragged(_ gestureRecognizer: UIPanGestureRecognizer) {
        xFromCenter = gestureRecognizer.translation(in: self).x;
        yFromCenter = gestureRecognizer.translation(in: self).y;
        
        switch (gestureRecognizer.state) {
            case .began:
                self.originalPoint = self.center;
                break;
            
            
            case .changed:
                //%%% dictates rotation (see ROTATION_MAX and ROTATION_STRENGTH for details)
                let rotationStrength = min(xFromCenter / ROTATION_STRENGTH, ROTATION_MAX);
                
                //%%% degree change in radians
                let rotationAngel = (ROTATION_ANGLE * rotationStrength);
                
                //%%% amount the height changes when you move the card up to a certain point
                let scale = max(1 - fabs(rotationStrength) / SCALE_STRENGTH, SCALE_MAX);
                
                //%%% move the object's center by center + gesture coordinate
                self.center = CGPoint(x: self.originalPoint.x + xFromCenter, y: self.originalPoint.y + yFromCenter);
                
                //%%% rotate by certain amount
                let transform = CGAffineTransform(rotationAngle: rotationAngel);
                
                //%%% scale by certain amount
                let scaleTransform = transform.scaledBy(x: scale, y: scale);
                
                //%%% apply transformations
                self.transform = scaleTransform;
                
                 self.updateOverlay(xFromCenter)
                break;
            case .ended:
                afterSwipeAction()
            break;
            default:
            break;
        }
        
    }
    
    func afterSwipeAction() {
        if (xFromCenter > ACTION_MARGIN) {
            rightAction();
        } else if (xFromCenter < -ACTION_MARGIN){
            leftAction();
        } else {
            animateCardBack()
           
        }
    }
    
    func rightAction() {
        animateCardToTheRight()
        delegate?.cardSwipedRight(self)
    }
    
    func animateCardToTheRight() {
        let rightEdge = CGFloat(500)
        animateCardOutTo(rightEdge)
    }
    
    func leftAction() {
        animateCardToTheLeft()
        delegate?.cardSwipedLeft(self)
    }
    
    func animateCardToTheLeft() {
        let leftEdge = CGFloat(-500)
        animateCardOutTo(leftEdge)
    }
    
    func animateCardOutTo(_ edge: CGFloat) {
        let finishPoint = CGPoint(x: edge, y: 2*yFromCenter + self.originalPoint.y)
        UIView.animate(withDuration: 0.3, animations: {
            self.center = finishPoint;
            }, completion: {
                (value: Bool) in
                self.removeFromSuperview()
        })
        
    }

    func animateCardBack() {
        UIView.animate(withDuration: 0.3, animations: {
            self.center = self.originalPoint;
            self.transform = CGAffineTransform(rotationAngle: 0);
                self.overlayView?.alpha = 0;
            }
        )
    }
    
    func updateOverlay(_ distance: CGFloat) {
        if (distance > 0) {
            overlayView?.setMode(.right)
        } else {
            overlayView?.setMode(.left)
        }
        overlayView?.alpha = min(fabs(distance)/100, 0.4)
    }
    func rightClickAction() {
        rightAction()
    }
    
    func leftClickAction() {
        leftAction()
    }
    
    func setTheInformation(_ information: String?, color: String!) {
        let textFrameMargins = self.frame.size.width*0.1
        let textFrameMarginsSubtract = textFrameMargins*2
        self.information.frame = CGRect(x: textFrameMargins, y: textFrameMargins, width: self.frame.size.width-textFrameMarginsSubtract, height: self.frame.size.height-textFrameMarginsSubtract)
        self.information.font = UIFont (name: "KlinicSlab-Bold", size: 30)
        self.information.textAlignment = .center
        self.information.lineBreakMode = NSLineBreakMode.byWordWrapping
        self.information.numberOfLines = 0
        self.information.backgroundColor = UIColor.white
        self.information.text = information

        if (color=="CAT01") {
            self.information.textColor = UIColor.black
        } else if (color=="CAT02") {
            self.information.textColor = UIColor.brown
        } else if (color=="CAT03") {
            self.information.textColor = UIColor.blue
        } else {
            self.information.textColor = UIColor.black
        }
        
        
        
        self.addSubview(self.information)
    }
    
    
}

protocol DraggableViewDelegate {
    func cardSwipedLeft(_ card: DraggableView)
    func cardSwipedRight(_ card: DraggableView)
}
