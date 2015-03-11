//
//  Lesson1_2ViewController.swift
//  CoreAnimationLesson
//
//  Created by Naoyuki Takura on 2015/03/04.
//  Copyright (c) 2015年 Naoyuki Takura. All rights reserved.
//

import UIKit

class Lesson1_2ViewController: UIViewController {

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
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func segmentedValueChanged(target: UISegmentedControl) {
        
        switch (target.selectedSegmentIndex) {
        case 0:
            //
            myView.contentMode = UIViewContentMode.ScaleToFill

        case 1:
            //
            myView.contentMode = UIViewContentMode.ScaleAspectFit
            
        case 2:
            myView.contentMode = UIViewContentMode.ScaleAspectFill
            
        case 3:
            myView.contentMode = UIViewContentMode.Center
            
        case 4:
            myView.contentMode = UIViewContentMode.Bottom

        default:
            println("no such index. index : \(target.selectedSegmentIndex)")
        }
        
        println("geometryFlipped value : \(myView.layer.geometryFlipped)")
        
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
