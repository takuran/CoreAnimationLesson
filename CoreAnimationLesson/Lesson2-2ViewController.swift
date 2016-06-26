//
//  Lesson2-1ViewController.swift
//  CoreAnimationLesson
//
//  Created by Naoyuki Takura on 2016/04/09.
//  Copyright © 2016年 Naoyuki Takura. All rights reserved.
//

import UIKit

class Lesson2_2ViewController: UIViewController {
    
    typealias AnimationParams = (duration: Double, delay: Double, option: UIViewAnimationOptions, dampingRatio: CGFloat, velocity: CGFloat)
    
    @IBOutlet weak var ghostButton: UIButton!
    
    private var myView: Lesson2_2MyView!
    private var previousView: UIView!
    private var configurationView: Lesson2_2ConfigurationView!
    private var orignalFrame: CGRect?
    private let preViewOffsetX: CGFloat = 80.0
    private var enableGhost: Bool = false
    private var originalAnimationParam: AnimationParams?
    private var ghostAnimationParam: AnimationParams?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let offset: CGFloat = 70.0
        
        // create myView
        let myViewRect = CGRect(x: 0, y: 0, width: 60, height: 60)
        myView = Lesson2_2MyView(frame: myViewRect)
        myView.center = CGPoint(x: view.frame.width / 2, y: view.frame.height - 130)
        myView.backgroundColor = UIColor.blueColor()
        
        // add to view
        view.addSubview(myView)
        
        // create previousView
        let preViewRect = CGRect(x: 0, y: 0, width: 60, height: 60)
        previousView = UIView(frame: preViewRect)
        previousView.center = myView.center
        previousView.center.x = previousView.center.x - preViewOffsetX
        previousView.backgroundColor = UIColor.grayColor()
        previousView.alpha = 0.0
        previousView.layer.cornerRadius = previousView.frame.width / 2
        // add to view
        view.addSubview(previousView)
        
        // myViewの初期値を残しておく
        orignalFrame = myView.frame
        
        // create configuration view
        let configurationRect = CGRect(x: view.frame.width - 250, y: 64 + offset / 2, width: 300, height: view.frame.height - (64 + 44 + offset))
        // create form xib
        let configurationViewNib = UINib(nibName: "ConfigurationView", bundle: nil)
        configurationView = configurationViewNib.instantiateWithOwner(nil, options: nil)[0] as! Lesson2_2ConfigurationView
        configurationView.frame = configurationRect
        configurationView.backgroundColor = UIColor.whiteColor()
        configurationView.alpha = 0.9
        configurationView.layer.borderColor = UIColor.whiteColor().CGColor
        configurationView.layer.borderWidth = 1.0
        configurationView.layer.cornerRadius = 5.0
        configurationView.layer.shadowColor = UIColor.whiteColor().CGColor
        configurationView.layer.shadowOffset = CGSize(width: 0, height: 0)
        configurationView.layer.shadowOpacity = 0.5
        configurationView.layer.shadowRadius = 10.0
        
        // add to view of viewcontroller
        view.addSubview(configurationView)
        
        // hide configuration view
        configurationView.hide()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // button handler(perform do it)
    @IBAction func performDoIt(sender: AnyObject) {
        NSLog(" performDoIt called.")
        // ステータスバーとNavigationバーの高さ計算
        let topBarHeight = (self.navigationController?.navigationBar.frame.size.height)! + UIApplication.sharedApplication().statusBarFrame.size.height
        
        // duration
        let duration = atof(configurationView.durationLabel.text!)
        // delay
        let delay = atof(configurationView.delayLabel.text!)
        // animation option
        let option = configurationView.animationOption
        
        // copy to original animation params that be used for ghost animtion
        originalAnimationParam = (duration, delay, option, 0.0, 0.0)
        
        // log
        let binNumberOption = String(option.rawValue, radix: 2)
        NSLog("duration: \(duration), delay: \(delay), option: \(binNumberOption)")
        
        // perform animation
        UIView.animateWithDuration(duration, delay: delay, options: option, animations: {
            // animation
            self.myView.frame.origin.y = topBarHeight + 50
            
        }) { (complete) in
            NSLog("animation completed.")
            // アニメーション完了時の処理
            self.myView.backgroundColor = UIColor.redColor()

        }
        
        // animation for a ghorst view
        if enableGhost {
            UIView.animateWithDuration((ghostAnimationParam?.duration)!, delay: (ghostAnimationParam?.delay)!, options: (ghostAnimationParam?.option)!, animations: {
                // animation
                self.previousView.frame.origin.y = topBarHeight + 50
                
            }) { (complete) in
                NSLog("animation completed.")
                // アニメーション完了時の処理
                self.previousView.backgroundColor = UIColor.redColor()
                
            }
        }
        
    }
    
    // button handler(
    // clear button
    @IBAction func rewindAnimation(sender: AnyObject) {
        NSLog("rewind is called.")
        
        // myView
        myView.frame = orignalFrame!
        if enableGhost {
            myView.center.x = myView.center.x + preViewOffsetX
        }
        myView.backgroundColor = UIColor.blueColor()
        myView.setNeedsLayout()
        
        // previousView
        previousView.frame = orignalFrame!
        previousView.frame.origin.x = previousView.frame.origin.x - preViewOffsetX
        previousView.backgroundColor = UIColor.grayColor()
    }
    
    // change configurtion
    @IBAction func changeConfiguration(sender: AnyObject) {
        guard let condView = configurationView else {
            return
        }
        
        switch condView.condition {
        case .Hide:
            condView.show()
            
        case .Show:
            condView.hide()
            
        default:
            break
        }
        
    }
    
    // toggle ghost
    @IBAction func toggleGhost(sender: AnyObject) {
        if enableGhost {
            // disable ghost
            ghostButton.setTitle("create ghost", forState: UIControlState.Normal)
            ghostButton.setTitleColor(ghostButton.tintColor, forState: UIControlState.Normal)
            
            // clear ghost animation param
            ghostAnimationParam = nil
            
            // myView shift back
            UIView.animateWithDuration(0.3, animations: { 
                    //
                    self.myView.center.x = self.myView.center.x - self.preViewOffsetX
                    self.previousView.alpha = 0.0
                
                }, completion: { (complete) in
                    //
                    
            })
            
            
        } else {
            // enable ghost
            ghostButton.setTitle("remove ghost", forState: UIControlState.Normal)
            ghostButton.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
            
            // animation param
            ghostAnimationParam = originalAnimationParam
            
            // myView shift to right side
            UIView.animateWithDuration(0.3, animations: { 
                    //
                    self.myView.center.x = self.myView.center.x + self.preViewOffsetX
                    self.previousView.alpha = 0.6
                
                }, completion: { (complete) in
                    //
                    
            })
            
        }
        
        enableGhost = !enableGhost
        
    }
    
    
}
