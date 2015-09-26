//
//  Lesson1-7ViewController.swift
//  CoreAnimationLesson
//
//  Created by Naoyuki Takura on 2015/04/14.
//  Copyright (c) 2015年 Naoyuki Takura. All rights reserved.
//

import UIKit

class Lesson1_7ViewController: UIViewController {
    @IBOutlet weak var myView: Lesson1_7View!
    
    private var newLayer: CALayer!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // create new layer
        newLayer = CALayer()
        newLayer.frame = CGRectMake(0, 0, 100, 100)
        newLayer.contentsScale = UIScreen.mainScreen().scale
        // set delegate
        newLayer.delegate = self
        
        // add new layer to uiview hosted layer
        myView.layer.addSublayer(newLayer)
        
        // display new layer
        newLayer.display()
    }
    
    override func viewDidDisappear(animated: Bool) {
        // clean up
        newLayer.delegate = nil
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

/***
    override func displayLayer(layer: CALayer!) {
        //
    }
***/
    
    override func drawLayer(layer: CALayer, inContext ctx: CGContext) {
        NSLog("perform drawLayer.")
        //
        CGContextSetFillColorWithColor(ctx, UIColor.redColor().CGColor)
        CGContextFillEllipseInRect(ctx, layer.frame)
    }
    
    
}
