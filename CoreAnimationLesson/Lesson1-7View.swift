//
//  Lesson1-7View.swift
//  CoreAnimationLesson
//
//  Created by Naoyuki Takura on 2015/04/26.
//  Copyright (c) 2015年 Naoyuki Takura. All rights reserved.
//

import UIKit

class Lesson1_7View: UIView {

    // custom draw
    override func drawRect(rect: CGRect) {
        // get context
        let context: CGContext! = UIGraphicsGetCurrentContext()
        
        // draw with context
        // set fill color
        CGContextSetFillColorWithColor(context, UIColor.blueColor().CGColor)
        // draw ellpise in rect
        CGContextFillEllipseInRect(context, rect)

    }
}
