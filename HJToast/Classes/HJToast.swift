//
//  HJToast.swift
//  Pods
//
//  Created by Himanshu Joshi on 12/19/2019.
//  Copyright (c) 2019 Himanshu Joshi. All rights reserved.
//


// This code is distributed under the terms and conditions of the MIT license.

//  Copyright (c) 2019 Himanshu Joshi
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
    public var font: UIFont = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.footnote)
    public var textColor: UIColor = UIColor.white
    public var textAlignment: NSTextAlignment = .center
    public var leftView: UIView?
    public var rightView: UIView?
    public var toastDuration: TimeInterval?
    public var animateDuration: TimeInterval = 0.25
    public var edgeInsets: UIEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    
    
    
    // Private properties
    private var _label: UILabel!
    private var _haveLeftView: Bool = false
    private var _haveRightView: Bool = false
    private var _bottomConstraint: NSLayoutConstraint!
    
    public func bakeToast(withMessage msg: String, inView: UIView) {
        
        commonInit()
        
        _label.text = msg
        _label.sizeToFit()
        
        
        frame = CGRect(x: 0.0, y: 0.0, width: inView.bounds.width, height: _label.bounds.height + edgeInsets.top + edgeInsets.bottom)
        
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
    
    private func commonInit() {
        
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
            leftViewWidth.priority = UILayoutPriority(rawValue: 1)
            
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
            rightViewWidth.priority = UILayoutPriority(rawValue: 1)
            
            addConstraints([rightViewCenterY, rightViewTrailing, rightViewWidth])
        }
        
        
        // Adding a label
        _label = UILabel(frame: .zero)
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
    
    private func slideUp() {
        layoutIfNeeded()
        _bottomConstraint.constant = 0
        
        UIView.animate(withDuration: animateDuration, delay: 0.0, options: .curveEaseInOut, animations: {
            self.layoutIfNeeded()
        }) { (bol) in
            self.slideDown()
        }
        
        
    }
    
    private func slideDown() {
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
