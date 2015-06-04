//
//  ViewController.swift
//  week3-drawer
//
//  Created by Court Kizer on 6/4/15.
//  Copyright (c) 2015 blackislandstudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slidingDrawer: UIView!
    @IBOutlet weak var happyImageView: UIImageView!
    @IBOutlet weak var excitedImageView: UIImageView!
    @IBOutlet weak var tongueImageView: UIImageView!
    @IBOutlet weak var winkImageView: UIImageView!
    @IBOutlet weak var sadImageView: UIImageView!
    @IBOutlet weak var deadImageView: UIImageView!
    
    var initialCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        slidingDrawer.backgroundColor = UIColor(red:0.945,  green:0.945,  blue:0.945, alpha:1)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPanHappy(sender: UIPanGestureRecognizer) {
        var location = sender.locationInView(view)
        var translation = sender.translationInView(view)
        var velocity = sender.velocityInView(view)
        
        NSLog("pan happened \(location)")
        NSLog("pan happened \(translation)")
        happyImageView.center = location

        
        if sender.state == UIGestureRecognizerState.Began {
            NSLog("panning started")
            initialCenter = happyImageView.center
            
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.happyImageView.transform = CGAffineTransformMakeScale(1.4, 1.4)
            })
            
        } else if sender.state == UIGestureRecognizerState.Changed {
            NSLog("panning changed")
            self.happyImageView.center = CGPoint(x: translation.x + initialCenter.x, y: translation.y + initialCenter.y)
            
        } else if sender.state == UIGestureRecognizerState.Ended {
            NSLog("panning ended")
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.happyImageView.transform = CGAffineTransformMakeScale(1.0, 1.0)
            })
        }
    }
    
    @IBAction func didPanExcited(sender: UIPanGestureRecognizer) {
        var location = sender.locationInView(view)
        var translation = sender.translationInView(view)
        var velocity = sender.velocityInView(view)
        
        NSLog("pan happened \(location)")
        NSLog("pan happened \(translation)")
        excitedImageView.center = location
        
        
        if sender.state == UIGestureRecognizerState.Began {
            NSLog("panning started")
            initialCenter = excitedImageView.center
            
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.excitedImageView.transform = CGAffineTransformMakeScale(1.4, 1.4)
            })
            
        } else if sender.state == UIGestureRecognizerState.Changed {
            NSLog("panning changed")
            self.excitedImageView.center = CGPoint(x: translation.x + initialCenter.x, y: translation.y + initialCenter.y)
            
        } else if sender.state == UIGestureRecognizerState.Ended {
            NSLog("panning ended")
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.excitedImageView.transform = CGAffineTransformMakeScale(1.0, 1.0)
            })
        }
    }
    
    @IBAction func didPanTongue(sender: UIPanGestureRecognizer) {
        var location = sender.locationInView(view)
        var translation = sender.translationInView(view)
        var velocity = sender.velocityInView(view)
        
        NSLog("pan happened \(location)")
        NSLog("pan happened \(translation)")
        tongueImageView.center = location
        
        
        if sender.state == UIGestureRecognizerState.Began {
            NSLog("panning started")
            initialCenter = tongueImageView.center
            
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.tongueImageView.transform = CGAffineTransformMakeScale(1.4, 1.4)
            })
            
        } else if sender.state == UIGestureRecognizerState.Changed {
            NSLog("panning changed")
            self.tongueImageView.center = CGPoint(x: translation.x + initialCenter.x, y: translation.y + initialCenter.y)
            
        } else if sender.state == UIGestureRecognizerState.Ended {
            NSLog("panning ended")
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.tongueImageView.transform = CGAffineTransformMakeScale(1.0, 1.0)
            })
        }
    }
    
    @IBAction func didPanWink(sender: UIPanGestureRecognizer) {
        var location = sender.locationInView(view)
        var translation = sender.translationInView(view)
        var velocity = sender.velocityInView(view)
        
        NSLog("pan happened \(location)")
        NSLog("pan happened \(translation)")
        winkImageView.center = location
        
        
        if sender.state == UIGestureRecognizerState.Began {
            NSLog("panning started")
            initialCenter = winkImageView.center
            
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.winkImageView.transform = CGAffineTransformMakeScale(1.4, 1.4)
            })
            
        } else if sender.state == UIGestureRecognizerState.Changed {
            NSLog("panning changed")
            self.winkImageView.center = CGPoint(x: translation.x + initialCenter.x, y: translation.y + initialCenter.y)
            
        } else if sender.state == UIGestureRecognizerState.Ended {
            NSLog("panning ended")
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.winkImageView.transform = CGAffineTransformMakeScale(1.0, 1.0)
            })
        }
    }
    
    @IBAction func didPanSad(sender: UIPanGestureRecognizer) {
        var location = sender.locationInView(view)
        var translation = sender.translationInView(view)
        var velocity = sender.velocityInView(view)
        
        NSLog("pan happened \(location)")
        NSLog("pan happened \(translation)")
        sadImageView.center = location
        
        
        if sender.state == UIGestureRecognizerState.Began {
            NSLog("panning started")
            initialCenter = sadImageView.center
            
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.sadImageView.transform = CGAffineTransformMakeScale(1.4, 1.4)
            })
            
        } else if sender.state == UIGestureRecognizerState.Changed {
            NSLog("panning changed")
            self.sadImageView.center = CGPoint(x: translation.x + initialCenter.x, y: translation.y + initialCenter.y)
            
        } else if sender.state == UIGestureRecognizerState.Ended {
            NSLog("panning ended")
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.sadImageView.transform = CGAffineTransformMakeScale(1.0, 1.0)
            })
        }
    }
    
    @IBAction func didPanDead(sender: UIPanGestureRecognizer) {
        var location = sender.locationInView(view)
        var translation = sender.translationInView(view)
        var velocity = sender.velocityInView(view)
        
        NSLog("pan happened \(location)")
        NSLog("pan happened \(translation)")
        deadImageView.center = location
        
        
        if sender.state == UIGestureRecognizerState.Began {
            NSLog("panning started")
            initialCenter = deadImageView.center
            
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.deadImageView.transform = CGAffineTransformMakeScale(1.4, 1.4)
            })
            
        } else if sender.state == UIGestureRecognizerState.Changed {
            NSLog("panning changed")
            self.deadImageView.center = CGPoint(x: translation.x + initialCenter.x, y: translation.y + initialCenter.y)
            
        } else if sender.state == UIGestureRecognizerState.Ended {
            NSLog("panning ended")
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.deadImageView.transform = CGAffineTransformMakeScale(1.0, 1.0)
            })
        }
    }

    










}


