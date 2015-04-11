//
//  Lesson1-6ViewController.swift
//  CoreAnimationLesson
//
//  Created by Naoyuki Takura on 2015/04/05.
//  Copyright (c) 2015年 Naoyuki Takura. All rights reserved.
//

import UIKit

class Lesson1_6ViewController: UIViewController {
    @IBOutlet weak var myView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // set image to myView
        let image = UIImage(named: "figure1.png")
        myView.layer.contents = image?.CGImage
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func defaultRect(sender: AnyObject) {
        // set contentsCenter
        myView.layer.contentsCenter = CGRectMake(0.0, 0.0, 1.0, 1.0)
    }
    
    @IBAction func customRect(sender: AnyObject) {
        // set contentsCenter
        myView.layer.contentsCenter = CGRectMake(0.25, 0.25, 0.5, 0.5)
    }

}
