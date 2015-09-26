//
//  Lesson1_3ViewController.swift
//  CoreAnimationLesson
//
//  Created by Naoyuki Takura on 2015/03/09.
//  Copyright (c) 2015年 Naoyuki Takura. All rights reserved.
//

import UIKit

class Lesson1_3ViewController: UIViewController {

    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var mySegmentedControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // initialize segmented control
        mySegmentedControl.addTarget(self, action: "segmentedValueChanged:", forControlEvents: UIControlEvents.ValueChanged)

        // image content
        let image = UIImage(named: "chess.png")
        
        // set image to layer contents
        myView.layer.contents = image?.CGImage
        
        // set geometryFlipped to YES
//        myView.layer.geometryFlipped = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func segmentedValueChanged(target: UISegmentedControl) {
        
        switch (target.selectedSegmentIndex) {
        case 0:
            //
            myView.layer.contentsGravity = kCAGravityResize
            
        case 1:
            //
            //myView.contentMode = UIViewContentMode.ScaleAspectFit
            myView.layer.contentsGravity = kCAGravityResizeAspect
            
        case 2:
            //myView.contentMode = UIViewContentMode.ScaleAspectFill
            myView.layer.contentsGravity = kCAGravityResizeAspectFill
            
        case 3:
            //myView.contentMode = UIViewContentMode.Center
            myView.layer.contentsGravity = kCAGravityCenter
            
        case 4:
            //myView.contentMode = UIViewContentMode.Bottom
            myView.layer.contentsGravity = kCAGravityBottom
            
        default:
            print("no such index. index : \(target.selectedSegmentIndex)")
        }
        
        print("geometryFlipped value : \(myView.layer.geometryFlipped)")
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
