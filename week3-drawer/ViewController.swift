//
//  ViewController.swift
//  week3-drawer
//
//  Created by Court Kizer on 6/4/15.
//  Copyright (c) 2015 blackislandstudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var containerView: UIView!
    @IBOutlet weak var slidingDrawer: UIView!
    // the 😄 faces
    @IBOutlet weak var happyImageView: UIImageView!
    @IBOutlet weak var excitedImageView: UIImageView!
    @IBOutlet weak var tongueImageView: UIImageView!
    @IBOutlet weak var winkImageView: UIImageView!
    @IBOutlet weak var sadImageView: UIImageView!
    @IBOutlet weak var deadImageView: UIImageView!
    
    var initialCenter: CGPoint!
    var trayOriginalCenter: CGPoint!
    var newlyCreatedFace: UIImageView!
    var upPosition: CGFloat!
    var downPosition: CGFloat!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        slidingDrawer.backgroundColor = UIColor(red:0.945,  green:0.945,  blue:0.945, alpha:1)
        // var trayUpPosition = slidingDrawer.center
        // println(trayUpPosition)
        self.upPosition = slidingDrawer.center.y
        self.downPosition = self.view.frame.height - 30
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPanTray(sender: UIPanGestureRecognizer) {
        var location = sender.locationInView(view)
        var translation = sender.translationInView(view)
        var velocity = sender.velocityInView(view)
        
        NSLog("pan happened \(location)")
        NSLog("pan happened \(translation)")

        
        if sender.state == UIGestureRecognizerState.Began {
            NSLog("panning started")
            trayOriginalCenter = slidingDrawer.center
        } else if sender.state == UIGestureRecognizerState.Changed {
            NSLog("panning changed")
            slidingDrawer.center = CGPoint(x: trayOriginalCenter.x, y: trayOriginalCenter.y + translation.y)
            
        } else if sender.state == UIGestureRecognizerState.Ended {
            NSLog("panning ended")
            
            if velocity.y > 0 {
                println("moving down")
                self.slidingDrawer.frame.origin.y = downPosition
            } else {
                println("moving up")
                self.slidingDrawer.center.y = upPosition
            }
        }
    }
    
    @IBAction func didPanHappy(sender: UIPanGestureRecognizer) {
        var location = sender.locationInView(view)
        var translation = sender.translationInView(view)
        var velocity = sender.velocityInView(view)
        
        NSLog("pan happened \(location)")
        NSLog("pan happened \(translation)")
        initialCenter = happyImageView.center

        
        if sender.state == UIGestureRecognizerState.Began {
            initialCenter = happyImageView.center
            
            var imageView = sender.view as! UIImageView
            newlyCreatedFace = UIImageView(image: imageView.image)
            view.addSubview(newlyCreatedFace)
            newlyCreatedFace.center = imageView.center
            newlyCreatedFace.center.y += slidingDrawer.frame.origin.y
            println(newlyCreatedFace.center.y)
            
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.newlyCreatedFace.transform = CGAffineTransformMakeScale(1.4, 1.4)
            })
            
        } else if sender.state == UIGestureRecognizerState.Changed {
            NSLog("panning changed")
            self.newlyCreatedFace.center = CGPoint(x: translation.x + initialCenter.x, y: translation.y + initialCenter.y + slidingDrawer.frame.origin.y)
            
            
        } else if sender.state == UIGestureRecognizerState.Ended {
            NSLog("panning ended")
            
            self.newlyCreatedFace.userInteractionEnabled = true
            var panGestureRecognizer = UIPanGestureRecognizer(target: self, action: "onCustomPan:")
            self.newlyCreatedFace.addGestureRecognizer(panGestureRecognizer)
            
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.newlyCreatedFace.transform = CGAffineTransformMakeScale(1.0, 1.0)
            })
            
            
        }
    }
    
    func onCustomPan(panGestureRecognizer: UIPanGestureRecognizer) {
        var location = panGestureRecognizer.locationInView(view)
        var translation = panGestureRecognizer.translationInView(view)
        var velocity = panGestureRecognizer.velocityInView(view)
        
        println("shit happened")
        // User tapped at the point above. Do something with that if you want.
        
        var imageView = panGestureRecognizer.view as! UIImageView
        

        if panGestureRecognizer.state == UIGestureRecognizerState.Began {
            initialCenter = imageView.center
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                imageView.transform = CGAffineTransformMakeScale(1.4, 1.4)
            })
            
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Changed {
            NSLog("panning changed")
            imageView.center = CGPoint(x: translation.x + initialCenter.x, y: translation.y + initialCenter.y)
            
            
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Ended {
            NSLog("panning ended")
            
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                imageView.transform = CGAffineTransformMakeScale(1.0, 1.0)
            })
            
            
        }
        
        
        
        
    }
    
    @IBAction func didPanExcited(sender: UIPanGestureRecognizer) {
        var location = sender.locationInView(view)
        var translation = sender.translationInView(view)
        var velocity = sender.velocityInView(view)
        NSLog("pan happened \(location)")
        NSLog("pan happened \(translation)")
        
        
        if sender.state == UIGestureRecognizerState.Began {
            initialCenter = excitedImageView.center
            
            var imageView = sender.view as! UIImageView
            newlyCreatedFace = UIImageView(image: imageView.image)
            view.addSubview(newlyCreatedFace)
            newlyCreatedFace.center = imageView.center
            newlyCreatedFace.center.y += slidingDrawer.frame.origin.y
            println(newlyCreatedFace.center.y)
            
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.newlyCreatedFace.transform = CGAffineTransformMakeScale(1.4, 1.4)
            })
            
        } else if sender.state == UIGestureRecognizerState.Changed {
            NSLog("panning changed")
            self.newlyCreatedFace.center = CGPoint(x: translation.x + initialCenter.x, y: translation.y + initialCenter.y + slidingDrawer.frame.origin.y)
            
            
        } else if sender.state == UIGestureRecognizerState.Ended {
            NSLog("panning ended")
            
            self.newlyCreatedFace.userInteractionEnabled = true
            var panGestureRecognizer = UIPanGestureRecognizer(target: self, action: "onCustomPan:")
            self.newlyCreatedFace.addGestureRecognizer(panGestureRecognizer)
            
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.newlyCreatedFace.transform = CGAffineTransformMakeScale(1.0, 1.0)
            })
            
            
        }
    }
    
    @IBAction func didPanTongue(sender: UIPanGestureRecognizer) {
        var location = sender.locationInView(view)
        var translation = sender.translationInView(view)
        var velocity = sender.velocityInView(view)
        NSLog("pan happened \(location)")
        NSLog("pan happened \(translation)")
        
        
        if sender.state == UIGestureRecognizerState.Began {
            initialCenter = tongueImageView.center
            
            var imageView = sender.view as! UIImageView
            newlyCreatedFace = UIImageView(image: imageView.image)
            view.addSubview(newlyCreatedFace)
            newlyCreatedFace.center = imageView.center
            newlyCreatedFace.center.y += slidingDrawer.frame.origin.y
            println(newlyCreatedFace.center.y)
            
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.newlyCreatedFace.transform = CGAffineTransformMakeScale(1.4, 1.4)
            })
            
        } else if sender.state == UIGestureRecognizerState.Changed {
            NSLog("panning changed")
            self.newlyCreatedFace.center = CGPoint(x: translation.x + initialCenter.x, y: translation.y + initialCenter.y + slidingDrawer.frame.origin.y)
            
            
        } else if sender.state == UIGestureRecognizerState.Ended {
            NSLog("panning ended")
            
            self.newlyCreatedFace.userInteractionEnabled = true
            var panGestureRecognizer = UIPanGestureRecognizer(target: self, action: "onCustomPan:")
            self.newlyCreatedFace.addGestureRecognizer(panGestureRecognizer)
            
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.newlyCreatedFace.transform = CGAffineTransformMakeScale(1.0, 1.0)
            })
            
            
        }
    }
    
    @IBAction func didPanWink(sender: UIPanGestureRecognizer) {
        var location = sender.locationInView(view)
        var translation = sender.translationInView(view)
        var velocity = sender.velocityInView(view)
        NSLog("pan happened \(location)")
        NSLog("pan happened \(translation)")
        
        
        if sender.state == UIGestureRecognizerState.Began {
            initialCenter = winkImageView.center
            
            var imageView = sender.view as! UIImageView
            newlyCreatedFace = UIImageView(image: imageView.image)
            view.addSubview(newlyCreatedFace)
            newlyCreatedFace.center = imageView.center
            newlyCreatedFace.center.y += slidingDrawer.frame.origin.y
            println(newlyCreatedFace.center.y)
            
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.newlyCreatedFace.transform = CGAffineTransformMakeScale(1.4, 1.4)
            })
            
        } else if sender.state == UIGestureRecognizerState.Changed {
            NSLog("panning changed")
            self.newlyCreatedFace.center = CGPoint(x: translation.x + initialCenter.x, y: translation.y + initialCenter.y + slidingDrawer.frame.origin.y)
            
            
        } else if sender.state == UIGestureRecognizerState.Ended {
            NSLog("panning ended")
            
            self.newlyCreatedFace.userInteractionEnabled = true
            var panGestureRecognizer = UIPanGestureRecognizer(target: self, action: "onCustomPan:")
            self.newlyCreatedFace.addGestureRecognizer(panGestureRecognizer)
            
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.newlyCreatedFace.transform = CGAffineTransformMakeScale(1.0, 1.0)
            })
            
            
        }
    }
    
    @IBAction func didPanSad(sender: UIPanGestureRecognizer) {
        var location = sender.locationInView(view)
        var translation = sender.translationInView(view)
        var velocity = sender.velocityInView(view)
        
        NSLog("pan happened \(location)")
        NSLog("pan happened \(translation)")
        
        if sender.state == UIGestureRecognizerState.Began {
            initialCenter = sadImageView.center
            
            var imageView = sender.view as! UIImageView
            newlyCreatedFace = UIImageView(image: imageView.image)
            view.addSubview(newlyCreatedFace)
            newlyCreatedFace.center = imageView.center
            newlyCreatedFace.center.y += slidingDrawer.frame.origin.y
            println(newlyCreatedFace.center.y)
            
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.newlyCreatedFace.transform = CGAffineTransformMakeScale(1.4, 1.4)
            })
            
        } else if sender.state == UIGestureRecognizerState.Changed {
            NSLog("panning changed")
            self.newlyCreatedFace.center = CGPoint(x: translation.x + initialCenter.x, y: translation.y + initialCenter.y + slidingDrawer.frame.origin.y)
            
            
        } else if sender.state == UIGestureRecognizerState.Ended {
            NSLog("panning ended")
            
            self.newlyCreatedFace.userInteractionEnabled = true
            var panGestureRecognizer = UIPanGestureRecognizer(target: self, action: "onCustomPan:")
            self.newlyCreatedFace.addGestureRecognizer(panGestureRecognizer)
            
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.newlyCreatedFace.transform = CGAffineTransformMakeScale(1.0, 1.0)
            })
            
            
        }
    }
    
    @IBAction func didPanDead(sender: UIPanGestureRecognizer) {
        var location = sender.locationInView(view)
        var translation = sender.translationInView(view)
        var velocity = sender.velocityInView(view)
        NSLog("pan happened \(location)")
        NSLog("pan happened \(translation)")
        
        
        if sender.state == UIGestureRecognizerState.Began {
            initialCenter = deadImageView.center
            
            var imageView = sender.view as! UIImageView
            newlyCreatedFace = UIImageView(image: imageView.image)
            view.addSubview(newlyCreatedFace)
            newlyCreatedFace.center = imageView.center
            newlyCreatedFace.center.y += slidingDrawer.frame.origin.y
            println(newlyCreatedFace.center.y)
            
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.newlyCreatedFace.transform = CGAffineTransformMakeScale(1.4, 1.4)
            })
            
        } else if sender.state == UIGestureRecognizerState.Changed {
            NSLog("panning changed")
            self.newlyCreatedFace.center = CGPoint(x: translation.x + initialCenter.x, y: translation.y + initialCenter.y + slidingDrawer.frame.origin.y)
            
            
        } else if sender.state == UIGestureRecognizerState.Ended {
            NSLog("panning ended")
            
            self.newlyCreatedFace.userInteractionEnabled = true
            var panGestureRecognizer = UIPanGestureRecognizer(target: self, action: "onCustomPan:")
            self.newlyCreatedFace.addGestureRecognizer(panGestureRecognizer)
            
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.newlyCreatedFace.transform = CGAffineTransformMakeScale(1.0, 1.0)
            })
            
            
        }
    }

    










}


