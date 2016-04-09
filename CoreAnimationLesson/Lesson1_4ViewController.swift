//
//  Lesson1_4ViewController.swift
//  CoreAnimationLesson
//
//  Created by Naoyuki Takura on 2015/03/22.
//  Copyright (c) 2015年 Naoyuki Takura. All rights reserved.
//

import UIKit

class Lesson1_4ViewController: UIViewController {

    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var mySegmentedControl: UISegmentedControl!
    @IBOutlet weak var mySwitch: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // image
        let image = UIImage(named: "chess.png")
        myView.layer.contents = image?.CGImage
        myView.layer.contentsGravity = kCAGravityCenter
        
        // set default contentsScale to The Retina value
        myView.layer.contentsScale = UIScreen.mainScreen().scale
        // set default clip setting
        myView.layer.masksToBounds = true
        
        // set action for segmented control
        mySegmentedControl.addTarget(self, action: #selector(Lesson1_4ViewController.segmentedValueChanged(_:)), forControlEvents: UIControlEvents.ValueChanged)
        // set action for switch
        mySwitch.addTarget(self, action: #selector(Lesson1_4ViewController.switchValueChanged(_:)), forControlEvents: UIControlEvents.ValueChanged)
        
        // dump contentsScale
        print("contentsScale : \(myView.layer.contentsScale)")
        print("image Scale   : \(image?.scale)")
        print("UIScreen scale: \(UIScreen.mainScreen().scale)")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func segmentedValueChanged(target: UISegmentedControl) {
        if (target.selectedSegmentIndex == 0) {
            myView.layer.contentsScale = 1.0
            
        } else {
            myView.layer.contentsScale = 2.0
            
        }
    }
    
    func switchValueChanged(target: UISwitch) {
        if target.on {
            myView.layer.masksToBounds = true
        } else {
            myView.layer.masksToBounds = false
        }
    }
}
