//
//  Lesson1-1ViewController.swift
//  CoreAnimationLesson
//
//  Created by Naoyuki Takura on 2015/03/01.
//  Copyright (c) 2015年 Naoyuki Takura. All rights reserved.
//

import UIKit
//import QuartzCore

class Lesson1_1ViewController: UIViewController {
    @IBOutlet weak var myView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        // create new layer
        let myLayer = CALayer()
        myLayer.frame = CGRectMake(10, 10, 200, 200)
        myLayer.backgroundColor = UIColor.blueColor().CGColor

        // add to view
        myView.layer.addSublayer(myLayer)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
