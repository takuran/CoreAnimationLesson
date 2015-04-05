//
//  Lesson1-5ViewController.swift
//  CoreAnimationLesson
//
//  Created by Naoyuki Takura on 2015/04/05.
//  Copyright (c) 2015年 Naoyuki Takura. All rights reserved.
//

import UIKit

class Lesson1_5ViewController: UIViewController {

    @IBOutlet weak var viewA: UIView!
    @IBOutlet weak var viewB: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // load image once.
        let image = UIImage(named: "AB.png")
        
        // A
        viewA.layer.contents = image?.CGImage
        viewA.layer.contentsRect = CGRectMake(0, 0, 0.5, 1.0)
        
        // B
        viewB.layer.contents = image?.CGImage
        viewB.layer.contentsRect = CGRectMake(0.5, 0, 0.5, 1.0)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
