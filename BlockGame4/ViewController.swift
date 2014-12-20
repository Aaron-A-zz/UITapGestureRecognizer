//
//  ViewController.swift
//  BlockGame4
//
//  Created by Mav3r1ck on 12/13/14.
//  Copyright (c) 2014 Mav3r1ck. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let coloredSquare = UIView()
    var isSquareDead = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        makeSquares()
    
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func makeSquares() {
        coloredSquare.backgroundColor = UIColor.blueColor()
        coloredSquare.frame = CGRect(x: 0, y: 120, width: 50, height: 50)
        self.view.addSubview(coloredSquare)
        
        let duration = 2.0
        let delay = 0.0
        let options = UIViewAnimationOptions.Autoreverse | UIViewAnimationOptions.Repeat | UIViewAnimationOptions.AllowUserInteraction
        let damping = 0.5
        let velocity = 1.0
        let size : CGFloat = CGFloat( Int(rand()) %  40 + 20)
        let yPosition : CGFloat = CGFloat( Int(rand()) %  200 + 20)
        
        UIView.animateWithDuration(duration, delay: delay, options: options, animations: {
            
            // any changes entered in this block will be animated
            self.coloredSquare.backgroundColor = UIColor.redColor()
            self.coloredSquare.frame = CGRectMake(self.view.frame.size.width, yPosition, size, size)
            self.coloredSquare.transform = CGAffineTransformMakeScale(1.5, 1.5)
            
            
            }, completion: nil)
        
        let tap = UITapGestureRecognizer(target: self, action: Selector("handleTap:"))
        view.addGestureRecognizer(tap)
    }

    
    func handleTap(gesture: UITapGestureRecognizer) {
        
        let tapLocation = gesture.locationInView(coloredSquare.superview)
        if coloredSquare.layer.presentationLayer().frame.contains(tapLocation) {
            println("Square tapped!")
           
            if isSquareDead { return }
            isSquareDead = true
          
            UIView.animateWithDuration(0.7, delay: 0.0, options: .CurveEaseOut, animations: {
                self.coloredSquare.transform = CGAffineTransformMakeScale(0.25, 0.25)
                }, completion: { finished in
                    UIView.animateWithDuration(2.0, delay: 2.0, options: nil, animations: {
                        self.coloredSquare.alpha = 0.0
                        }, completion: { finished in
                            self.coloredSquare.removeFromSuperview()
                    })
            })
        } else {
            println("Square not tapped!")
        }
    }

}

