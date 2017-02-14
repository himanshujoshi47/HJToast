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

open class HJToast: UIView {
    
    // Exposed properties
    open var font: UIFont = UIFont.systemFont(ofSize: 12.0)
    open var textColor: UIColor = UIColor.white
    open var textAlignment: NSTextAlignment = .center
    open var leftView: UIView?
    open var rightView: UIView?
    open var toastDuration: TimeInterval?
    open var animateDuration: TimeInterval = 0.25
    open var edgeInsets: UIEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10)
    
    
    
    // Private properties
    fileprivate var _label: UILabel!
    fileprivate var _haveLeftView: Bool = false
    fileprivate var _haveRightView: Bool = false
    fileprivate var _bottomConstraint: NSLayoutConstraint!
    
    open func bakeToast(withMessage msg: String, inView: UIView) {
        
        commonInit()
        
        _label.text = msg
        _label.sizeToFit()
        
        frame = CGRect(x: 0, y: 0, width: inView.bounds.width, height: _label.bounds.height + edgeInsets.top + edgeInsets.bottom)
        
        inView.addSubview(self)
        
        _bottomConstraint = NSLayoutConstraint(item: self,
                                               attribute: .bottom,
                                               relatedBy: .equal,
                                               toItem: inView,
                                               attribute: .bottom,
                                               multiplier: 1.0,
                                               constant: bounds.height)
        
        inView.addConstraint(_bottomConstraint)
        
        inView.addConstraint(NSLayoutConstraint(item: self,
                                                attribute: .trailing,
                                                relatedBy: .equal,
                                                toItem: inView,
                                                attribute: .trailing,
                                                multiplier: 1.0,
                                                constant: 0.0))
        
        inView.addConstraint(NSLayoutConstraint(item: self,
                                                attribute: .leading,
                                                relatedBy: .equal,
                                                toItem: inView,
                                                attribute: .leading,
                                                multiplier: 1.0,
                                                constant: 0.0))
        
        inView.addConstraint(NSLayoutConstraint(item: self,
                                                attribute: .height,
                                                relatedBy: .equal,
                                                toItem: nil,
                                                attribute: .notAnAttribute,
                                                multiplier: 1.0,
                                                constant: bounds.height))
        
        slideUp()
        
    }
    
    fileprivate func commonInit() {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        
        // Adding leftView, if provided
        if let _leftView = leftView {
            
            _leftView.translatesAutoresizingMaskIntoConstraints = false
            _haveLeftView = true
            addSubview(_leftView)
            
            let leftViewCenterY = NSLayoutConstraint(item: _leftView,
                                                     attribute: .centerY,
                                                     relatedBy: .equal,
                                                     toItem: self,
                                                     attribute: .centerY,
                                                     multiplier: 1.0,
                                                     constant: 0.0)
            
            let leftViewLeading = NSLayoutConstraint(item: _leftView,
                                                     attribute: .leading,
                                                     relatedBy: .equal,
                                                     toItem: self,
                                                     attribute: .leading,
                                                     multiplier: 1.0,
                                                     constant: edgeInsets.left)
            
            let leftViewWidth = NSLayoutConstraint(item: _leftView,
                                                   attribute: .width,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
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
                                                      attribute: .centerY,
                                                      relatedBy: .equal,
                                                      toItem: self,
                                                      attribute: .centerY,
                                                      multiplier: 1.0,
                                                      constant: 0.0)
            
            let rightViewTrailing = NSLayoutConstraint(item: _rightView,
                                                       attribute: .trailing,
                                                       relatedBy: .equal,
                                                       toItem: self,
                                                       attribute: .trailing,
                                                       multiplier: 1.0,
                                                       constant: -edgeInsets.right)
            
            let rightViewWidth = NSLayoutConstraint(item: _rightView,
                                                    attribute: .width,
                                                    relatedBy: .equal,
                                                    toItem: nil,
                                                    attribute: .notAnAttribute,
                                                    multiplier: 1.0,
                                                    constant: 0)
            rightViewWidth.priority = 1
            
            addConstraints([rightViewCenterY, rightViewTrailing, rightViewWidth])
        }
        
        
        // Adding a label
        _label = UILabel(frame: CGRect.zero)
        _label.translatesAutoresizingMaskIntoConstraints = false
        _label.textColor = textColor
        _label.numberOfLines = 0
        _label.lineBreakMode = .byWordWrapping
        _label.font = font
        _label.textAlignment = textAlignment
        addSubview(_label)
        
        addConstraint(NSLayoutConstraint(item: _label,
                                         attribute: .centerY,
                                         relatedBy: .equal,
                                         toItem: self,
                                         attribute: .centerY,
                                         multiplier: 1.0,
                                         constant: 0.0))
        
        addConstraint(NSLayoutConstraint(item: _label,
                                         attribute: .trailing,
                                         relatedBy: .equal,
                                         toItem: _haveRightView ? rightView : self,
                                         attribute:  _haveRightView ? .leading : .trailing,
                                         multiplier: 1.0,
                                         constant: -edgeInsets.right))
        
        addConstraint(NSLayoutConstraint(item: _label,
                                         attribute: .leading,
                                         relatedBy: .equal,
                                         toItem: _haveLeftView ? leftView : self,
                                         attribute: _haveLeftView ? .trailing : .leading,
                                         multiplier: 1.0,
                                         constant: edgeInsets.left))
        
    }
    
    fileprivate func slideUp() {
        layoutIfNeeded()
        _bottomConstraint.constant = 0
        
        UIView.animate(withDuration: animateDuration, delay: 0.0, options: .curveEaseInOut, animations: {
            self.layoutIfNeeded()
        }) { (bol) in
            self.slideDown()
        }
        
        
    }
    
    fileprivate func slideDown() {
        layoutIfNeeded()
        _bottomConstraint.constant = bounds.height
        
        let delay = toastDuration == nil ? Double(_label.text!.lengthOfBytes(using: String.Encoding.utf8)) * 0.1 : toastDuration!
        
        UIView.animate(withDuration: animateDuration, delay: delay, options: .curveEaseInOut, animations: {
            self.layoutIfNeeded()
        }) { (bol) in
            self.removeFromSuperview()
        }
    }
}
