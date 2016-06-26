//
//  Lesson2_1MyView.swift
//  CoreAnimationLesson
//
//  Created by Naoyuki Takura on 2016/05/05.
//  Copyright © 2016年 Naoyuki Takura. All rights reserved.
//

import UIKit

class Lesson2_2MyView: UIView {

    override func layoutSubviews() {
        super.layoutSubviews()

        layer.cornerRadius = frame.width / 2
    }

}
