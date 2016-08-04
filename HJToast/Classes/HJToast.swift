//
//  HJToast.swift
//  Pods
//
//  Created by Himanshu Joshi on 08/04/2016.
//  Copyright (c) 2016 Himanshu Joshi. All rights reserved.
//


// This code is distributed under the terms and conditions of the MIT license.

//  Copyright (c) 2016 Himanshu Joshi
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import UIKit

public class HJToast: UIView {
    
    // Exposed properties
    public var font: UIFont = UIFont.systemFontOfSize(12.0)
    public var textColor: UIColor = UIColor.whiteColor()
    public var textAlignment: NSTextAlignment = .Center
    public var leftView: UIView?
    public var rightView: UIView?
    public var toastDuration: NSTimeInterval?
    public var animateDuration: NSTimeInterval = 0.25
    public var edgeInsets: UIEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10)
    
    
    
    // Private properties
    private var _label: UILabel!
    private var _haveLeftView: Bool = false
    private var _haveRightView: Bool = false
    private var _bottomConstraint: NSLayoutConstraint!
    
    public func bakeToast(withMessage msg: String, inView: UIView) {
        
        commonInit()
        
        _label.text = msg
        _label.sizeToFit()
        
        frame = CGRectMake(0, 0, inView.bounds.width, _label.bounds.height + edgeInsets.top + edgeInsets.bottom)
        
        inView.addSubview(self)
        
        _bottomConstraint = NSLayoutConstraint(item: self,
                                               attribute: .Bottom,
                                               relatedBy: .Equal,
                                               toItem: inView,
                                               attribute: .Bottom,
                                               multiplier: 1.0,
                                               constant: bounds.height)
        
        inView.addConstraint(_bottomConstraint)
        
        inView.addConstraint(NSLayoutConstraint(item: self,
            attribute: .Trailing,
            relatedBy: .Equal,
            toItem: inView,
            attribute: .Trailing,
            multiplier: 1.0,
            constant: 0.0))
        
        inView.addConstraint(NSLayoutConstraint(item: self,
            attribute: .Leading,
            relatedBy: .Equal,
            toItem: inView,
            attribute: .Leading,
            multiplier: 1.0,
            constant: 0.0))
        
        inView.addConstraint(NSLayoutConstraint(item: self,
            attribute: .Height,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .NotAnAttribute,
            multiplier: 1.0,
            constant: bounds.height))
        
        slideUp()
        
    }
    
    private func commonInit() {
        
        translatesAutoresizingMaskIntoConstraints = false
    
        
        // Adding leftView, if provided
        if let _leftView = leftView {
            
            _leftView.translatesAutoresizingMaskIntoConstraints = false
            _haveLeftView = true
            addSubview(_leftView)
            
            let leftViewCenterY = NSLayoutConstraint(item: _leftView,
                                                     attribute: .CenterY,
                                                     relatedBy: .Equal,
                                                     toItem: self,
                                                     attribute: .CenterY,
                                                     multiplier: 1.0,
                                                     constant: 0.0)
            
            let leftViewLeading = NSLayoutConstraint(item: _leftView,
                                                     attribute: .Leading,
                                                     relatedBy: .Equal,
                                                     toItem: self,
                                                     attribute: .Leading,
                                                     multiplier: 1.0,
                                                     constant: edgeInsets.left)
            
            let leftViewWidth = NSLayoutConstraint(item: _leftView,
                                                   attribute: .Width,
                                                   relatedBy: .Equal,
                                                   toItem: nil,
                                                   attribute: .NotAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: 0)
            leftViewWidth.priority = 1
            
            addConstraints([leftViewCenterY, leftViewLeading, leftViewWidth])
        }
        
        
        // Adding rightView, if provided
        if let _rightView = rightView {
            
            _rightView.translatesAutoresizingMaskIntoConstraints = false
            
            _haveRightView = true
            addSubview(_rightView)
            
            
            let rightViewCenterY = NSLayoutConstraint(item: _rightView,
                                                      attribute: .CenterY,
                                                      relatedBy: .Equal,
                                                      toItem: self,
                                                      attribute: .CenterY,
                                                      multiplier: 1.0,
                                                      constant: 0.0)
            
            let rightViewTrailing = NSLayoutConstraint(item: _rightView,
                                                       attribute: .Trailing,
                                                       relatedBy: .Equal,
                                                       toItem: self,
                                                       attribute: .Trailing,
                                                       multiplier: 1.0,
                                                       constant: -edgeInsets.right)
            
            let rightViewWidth = NSLayoutConstraint(item: _rightView,
                                                    attribute: .Width,
                                                    relatedBy: .Equal,
                                                    toItem: nil,
                                                    attribute: .NotAnAttribute,
                                                    multiplier: 1.0,
                                                    constant: 0)
            rightViewWidth.priority = 1
            
            addConstraints([rightViewCenterY, rightViewTrailing, rightViewWidth])
        }
        
        
        // Adding a label
        _label = UILabel(frame: CGRectZero)
        _label.translatesAutoresizingMaskIntoConstraints = false
        _label.textColor = textColor
        _label.numberOfLines = 0
        _label.lineBreakMode = .ByWordWrapping
        _label.font = font
        _label.textAlignment = textAlignment
        addSubview(_label)
        
        addConstraint(NSLayoutConstraint(item: _label,
            attribute: .CenterY,
            relatedBy: .Equal,
            toItem: self,
            attribute: .CenterY,
            multiplier: 1.0,
            constant: 0.0))
        
        addConstraint(NSLayoutConstraint(item: _label,
            attribute: .Trailing,
            relatedBy: .Equal,
            toItem: _haveRightView ? rightView : self,
            attribute:  _haveRightView ? .Leading : .Trailing,
            multiplier: 1.0,
            constant: -edgeInsets.right))
        
        addConstraint(NSLayoutConstraint(item: _label,
            attribute: .Leading,
            relatedBy: .Equal,
            toItem: _haveLeftView ? leftView : self,
            attribute: _haveLeftView ? .Trailing : .Leading,
            multiplier: 1.0,
            constant: edgeInsets.left))
        
    }
    
    private func slideUp() {
        layoutIfNeeded()
        _bottomConstraint.constant = 0
        
        UIView.animateWithDuration(animateDuration, delay: 0.0, options: .CurveEaseInOut, animations: {
            self.layoutIfNeeded()
        }) { (bol) in
            self.slideDown()
        }
        
        
    }
    
    private func slideDown() {
        layoutIfNeeded()
        _bottomConstraint.constant = bounds.height
        
        let delay = toastDuration == nil ? Double(_label.text!.lengthOfBytesUsingEncoding(NSUTF8StringEncoding)) * 0.1 : toastDuration!
        
        UIView.animateWithDuration(animateDuration, delay: delay, options: .CurveEaseInOut, animations: {
            self.layoutIfNeeded()
        }) { (bol) in
            self.removeFromSuperview()
        }
    }
}