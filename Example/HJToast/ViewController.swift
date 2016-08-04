//
//  ViewController.swift
//  HJToast
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
import HJToast

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func showThemed(sender: AnyObject) {
        let toast = HJToast()
        toast.backgroundColor = UIColor(red: 191.0/255.0, green: 54.0/0255.0, blue: 12.0/255.0, alpha: 1.0)
        
        toast.bakeToast(withMessage: "Hey there! It's me...", inView: view)
    }
    
    @IBAction func timedToast(sender: AnyObject) {
        let toast = HJToast()
        toast.toastDuration = 3.0
        toast.backgroundColor = UIColor(red: 191.0/255.0, green: 54.0/255.0, blue: 12.0/255.0, alpha: 1.0)
        
        toast.bakeToast(withMessage: "Hey there! It's me...", inView: view)
    }
    
    @IBAction func showLeftComponent(sender: AnyObject) {
        let toast = HJToast()
        toast.backgroundColor = UIColor(red: 191.0/255.0, green: 54.0/255.0, blue: 12.0/255.0, alpha: 1.0)
        
        let leftBtn = UIButton(type: .System)
        leftBtn.setTitle("Left", forState: .Normal)
        leftBtn.setTitleColor(UIColor(red: 255.0/255.0, green: 171.0/255.0, blue: 145.0/255.0, alpha: 1.0), forState: .Normal)
        
        toast.leftView = leftBtn
        
        toast.bakeToast(withMessage: "Hey there! It's me...", inView: view)
    }
    
    @IBAction func showRightComponent(sender: AnyObject) {
        let toast = HJToast()
        toast.backgroundColor = UIColor(red: 191.0/255.0, green: 54.0/255.0, blue: 12.0/255.0, alpha: 1.0)
        
        let rightBtn = UIButton(type: .System)
        rightBtn.setTitle("Right", forState: .Normal)
        rightBtn.setTitleColor(UIColor(red: 255.0/255.0, green: 171.0/255.0, blue: 145.0/255.0, alpha: 1.0), forState: .Normal)
        
        toast.rightView = rightBtn
        
        toast.bakeToast(withMessage: "Hey there! It's me...", inView: view)
    }
    
    @IBAction func showAllComponent(sender: AnyObject) {
        let toast = HJToast()
        toast.backgroundColor = UIColor(red: 191.0/255.0, green: 54.0/255.0, blue: 12.0/255.0, alpha: 1.0)
        
        let leftBtn = UIButton(type: .System)
        leftBtn.setTitle("Left", forState: .Normal)
        leftBtn.setTitleColor(UIColor(red: 255.0/255.0, green: 171.0/255.0, blue: 145.0/255.0, alpha: 1.0), forState: .Normal)
        
        toast.leftView = leftBtn
        
        
        let rightBtn = UIButton(type: .System)
        rightBtn.setTitle("Right", forState: .Normal)
        rightBtn.setTitleColor(UIColor(red: 255.0/255.0, green: 171.0/255.0, blue: 145.0/255.0, alpha: 1.0), forState: .Normal)
        
        toast.rightView = rightBtn
        
        toast.bakeToast(withMessage: "Hey there! It's me...", inView: view)
    }

}

