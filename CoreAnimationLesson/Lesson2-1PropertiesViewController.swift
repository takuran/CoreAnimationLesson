//
//  Lesson2-1PropertiesViewController.swift
//  CoreAnimationLesson
//
//  Created by Naoyuki Takura on 2016/05/08.
//  Copyright © 2016年 Naoyuki Takura. All rights reserved.
//

import UIKit

class Lesson2_1PropertiesViewController: UIViewController {
    
    private var myView: UIView!
    private var originRect: CGRect!
    @IBOutlet weak var informationTextView: UITextView!
    @IBOutlet weak var animationTargetControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create myView
        let myViewRect = CGRect(x: 0, y: 0, width: 60, height: 60)
        myView = UIView(frame: myViewRect)
        myView.center = CGPoint(x: view.frame.width / 2, y: view.frame.height - 200)
        myView.backgroundColor = UIColor.blueColor()
        originRect = myView.frame
        
        // add to view
        view.addSubview(myView)
        
        // to front textivew
        view.bringSubviewToFront(informationTextView)
        
        // debug
        updateInformationDebugView()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // device rotate
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
        
        let ratioX = myView.center.x / view.frame.width
        let ratioY = myView.center.y / view.frame.height
        
        //
        if UIDevice.currentDevice().orientation.isLandscape {
            // landscape
            NSLog("Landscape.")
//            myView.center = CGPoint(x: view.frame.height / 2, y: view.frame.width - 150)
            myView.center = CGPoint(x: view.frame.height * ratioX, y: view.frame.width * ratioY)
            
        } else {
            // portrait
            NSLog("portrait.")
//            myView.center = CGPoint(x: view.frame.width / 2, y: view.frame.height - 150)
            myView.center = CGPoint(x: view.frame.height * ratioX, y: view.frame.width * ratioY)
            
        }
    }
    
    
    @IBAction func performDoIt(sender: AnyObject) {
        NSLog("performDoIt called.")
        
        UIView.animateWithDuration(0.5, delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
            
            switch self.animationTargetControl.selectedSegmentIndex {
            case 0:
                // move
                // change myView.center.y
                self.myView.center.y = 100
                
            case 1:
                // scale
                // transform
                let transform = CGAffineTransformMakeScale(2.0, 2.0)
                self.myView.transform = transform

            case 2:
                // alpha
                self.myView.alpha = 0.0
                
            case 3:
                // bg color
                self.myView.backgroundColor = UIColor.redColor()
                
            case 4:
                // all
                self.myView.center.y = 100
                let transform = CGAffineTransformMakeScale(2.0, 2.0)
                self.myView.transform = transform
                self.myView.alpha = 0.0
                self.myView.backgroundColor = UIColor.redColor()
                
            default:
                break
            }
            
        }) { (complete) in

            // rewind background color of myView
            self.myView.backgroundColor = UIColor.redColor()
            
            // debug
            print("frame : \(self.myView.frame)")
            print("center: \(self.myView.center)")
            print("anchor: \(self.myView.layer.anchorPoint)")
            self.updateInformationDebugView()
        }
        
        
        
    }
    
    @IBAction func rewindAnimation(sender: AnyObject) {
        NSLog("rewind Animation")
        
        myView.backgroundColor = UIColor.blueColor()
        myView.alpha = 1.0
        myView.transform = CGAffineTransformIdentity
        myView.frame = originRect
        
        // debug
        updateInformationDebugView()
        
    }
    

    private func updateInformationDebugView() {
        // debug
        informationTextView.text = "myView:\nframe: " + NSStringFromCGRect(myView.frame)
    }

}
