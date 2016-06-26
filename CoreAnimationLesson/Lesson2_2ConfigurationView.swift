//
//  Lesson2_1ConfigurationView.swift
//  CoreAnimationLesson
//
//  Created by Naoyuki Takura on 2016/04/23.
//  Copyright © 2016年 Naoyuki Takura. All rights reserved.
//

import UIKit

class Lesson2_2ConfigurationView: UIView, UIGestureRecognizerDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    // duration
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var durationSlider: UISlider!
    // delay
    @IBOutlet weak var delayLabel: UILabel!
    @IBOutlet weak var delaySlider: UISlider!
    // option
    @IBOutlet weak var optionPicker: UIPickerView!
    
//    struct UIViewAnimationOptions : OptionSetType {
//        init(rawValue rawValue: UInt)
//        static var LayoutSubviews: UIViewAnimationOptions { get }
//        static var AllowUserInteraction: UIViewAnimationOptions { get }
//        static var BeginFromCurrentState: UIViewAnimationOptions { get }
//        static var Repeat: UIViewAnimationOptions { get }
//        static var Autoreverse: UIViewAnimationOptions { get }
//        static var OverrideInheritedDuration: UIViewAnimationOptions { get }
//        static var OverrideInheritedCurve: UIViewAnimationOptions { get }
//        static var AllowAnimatedContent: UIViewAnimationOptions { get }
//        static var ShowHideTransitionViews: UIViewAnimationOptions { get }
//        static var OverrideInheritedOptions: UIViewAnimationOptions { get }
//
//        static var CurveEaseInOut: UIViewAnimationOptions { get }
//        static var CurveEaseIn: UIViewAnimationOptions { get }
//        static var CurveEaseOut: UIViewAnimationOptions { get }
//        static var CurveLinear: UIViewAnimationOptions { get }
//
//        static var TransitionNone: UIViewAnimationOptions { get }
//        static var TransitionFlipFromLeft: UIViewAnimationOptions { get }
//        static var TransitionFlipFromRight: UIViewAnimationOptions { get }
//        static var TransitionCurlUp: UIViewAnimationOptions { get }
//        static var TransitionCurlDown: UIViewAnimationOptions { get }
//        static var TransitionCrossDissolve: UIViewAnimationOptions { get }
//        static var TransitionFlipFromTop: UIViewAnimationOptions { get }
//        static var TransitionFlipFromBottom: UIViewAnimationOptions { get }
//    }
    
    enum AnimationOptions {
        case Curve(String, UIViewAnimationOptions)
        case Transition(String, UIViewAnimationOptions)
        case Other(String, UIViewAnimationOptions?)
    }
    
    // options
    let animationOptions:[[AnimationOptions]] = [
        // for curve
        [
            .Curve("CurveLinear", .CurveLinear) ,
            .Curve("CurveEaseInOut", .CurveEaseInOut),
            .Curve("CurveEaseIn", .CurveEaseIn),
            .Curve("CurveEaseOut", .CurveEaseOut)
        ],
        // for transition
        // not implements
        
        // for others
        [
            .Other("not specify", nil),
            .Other("LayoutSubviews", .LayoutSubviews),
            .Other("AllowUserInteraction", .AllowUserInteraction),
            .Other("BeginFromCurrentState", .BeginFromCurrentState),
            .Other("Repeat", .Repeat),
            .Other("Autoreverse", .Autoreverse),
            .Other("OverrideInheritedDuration", .OverrideInheritedDuration),
            .Other("OverrideInheritedCurve", .OverrideInheritedCurve),
            .Other("AllowAnimatedContent", .AllowAnimatedContent),
            .Other("ShowHideTransitionViews", .ShowHideTransitionViews),
            .Other("OverrideInheritedOptions", .OverrideInheritedOptions)
        ]
    ]
    
    var animationOption: UIViewAnimationOptions = .CurveLinear
    private var optionCurve: UIViewAnimationOptions? = .CurveLinear
    private var optionOther: UIViewAnimationOptions?
    
    // overlay
    var overlay: UIView = UIView()
    // tap gesture
    var tapGesture: UITapGestureRecognizer = UITapGestureRecognizer()
    
    // display contidion
    enum Condition {
        case Hide
        case Show
        case Processing
    }
    // condition my view
    var condition: Condition = .Show

    // initialize view
    override func awakeFromNib() {
        // duration
        durationLabel.text = "0.5"
        durationSlider.addTarget(self, action: #selector(Lesson2_2ConfigurationView.valueChangedDurationSlider), forControlEvents: UIControlEvents.ValueChanged)
        // delay
        delayLabel.text = "0.0"
        delaySlider.addTarget(self, action: #selector(Lesson2_2ConfigurationView.valueChangedDelaySlider), forControlEvents: UIControlEvents.ValueChanged)
        // options
        optionPicker.delegate = self
        optionPicker.dataSource = self
    }

    // duration slider event handler
    func valueChangedDurationSlider(sender: AnyObject?) {
        guard let slider = sender as? UISlider else {
            return
        }
        
        var durationValue = slider.value
        durationValue = durationValue * 100
        durationValue = roundf(durationValue) / 100
        
        durationLabel.text = String(durationValue)

    }
    
    // delay slider event handler
    func valueChangedDelaySlider(sender: AnyObject?) {
        guard let slider = sender as? UISlider else {
            return
        }

        var delay = slider.value
        delay = delay * 100
        delay = roundf(delay) / 100
        
        delayLabel.text = String(delay)
    }
    
    // hide configuration view
    func hide() {
        guard condition == .Show else {
            return
        }
        // condition to processing
        condition = .Processing
        
        // origin of x
        let originX = frame.origin.x
        // width for sliding to right
        let slideWidth = frame.width
        
        // move to right with animationg
        UIView.animateWithDuration(0.3, animations: { 
                //
                self.frame.origin.x = originX + slideWidth
                self.overlay.alpha = 0.0

            }) { (complete) in
                //
                self.condition = .Hide
                // remove overlay
                self.overlay.removeFromSuperview()
                // remove gesture
                self.overlay.removeGestureRecognizer(self.tapGesture)
        }
        
    }
    
    // show configuration view
    func show() {
        guard condition == .Hide else {
            return
        }
        // condition to processing
        condition = .Processing
        
        // show overlay
        if let superView = self.superview {
            overlay.frame = superView.frame
            overlay.backgroundColor = UIColor.grayColor()
            overlay.alpha = 0.0
            overlay.opaque = false

            // add to superview
//            superView.addSubview(overlay)
            superView.insertSubview(overlay, atIndex: 1)
            
            // gesture
            tapGesture.numberOfTapsRequired = 1
            tapGesture.delegate = self
            tapGesture.addTarget(self, action:#selector(Lesson2_2ConfigurationView.hide))
            overlay.addGestureRecognizer(tapGesture)
            
        }
        
        // origin of x
        let originX = frame.origin.x
        // width for sliding to left
        let slideWidth = frame.width
        
        // move to left with animating
        UIView.animateWithDuration(0.3, animations: {
            //
            self.frame.origin.x = originX - slideWidth
            self.overlay.alpha = 0.7
            
        }) { (complete) in
            //
            self.condition = .Show
        }

    }
    
    // MARK: - UIPickerViewDelegate implements
    // not in use now.
//    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        //
//        switch component {
//        case 0:
//            // curve option
//            return curveOptions[row]
//            
//        case 1:
//            // other options
//            return otherOptions[row]
//
//        default:
//            // other case
//            return ""
//        }
//        
//    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        // change font size
        let label = UILabel()
        label.font = UIFont(name: "Arial", size: 11.0)
        
        
        let option = animationOptions[component][row]
        switch option {
        case let .Curve(name, _):
            label.text = name
            
        case let .Other(name, _):
            label.text = name
            
        default:
            label.text = ""
            // nothing. to do
        }
        
        return label
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //
        let option = animationOptions[component][row]
        switch option {
        case let .Curve(_, option):
            optionCurve = option
            
        case let .Other(_, option):
            optionOther = option
            
        default:
            // nothing. to do
            break
        }
        
        if optionOther != nil {
            animationOption = [optionCurve!, optionOther!]
        } else {
            animationOption = optionCurve!
        }
    }


    // MARK: - UIPickerViewDataSource implements
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        //
        return 2
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        // UIViewAnimationOptions
        return animationOptions[component].count
    }
    


}
