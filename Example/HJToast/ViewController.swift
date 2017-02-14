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

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var timeField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(endEditing(_:)))
        view.addGestureRecognizer(tapGesture)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func endEditing(_ recognizer: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    
    @IBAction func showThemed(_ sender: AnyObject) {
        view.endEditing(true)
        
        let toast = HJToast()
        toast.backgroundColor = UIColor(red: 191.0/255.0, green: 54.0/0255.0, blue: 12.0/255.0, alpha: 1.0)
        
        toast.bakeToast(withMessage: "Hey there! It's me...", inView: view)
    }
    
    @IBAction func timedToast(_ sender: AnyObject) {
        view.endEditing(true)
        
        let toast = HJToast()
        
        let time = Double(timeField.text!)
        if time != 0 {
            toast.toastDuration = time
        }
        toast.backgroundColor = UIColor(red: 191.0/255.0, green: 54.0/255.0, blue: 12.0/255.0, alpha: 1.0)
        
        toast.bakeToast(withMessage: "Hey there! It's me...", inView: view)
    }
    
    @IBAction func showLeftComponent(_ sender: AnyObject) {
        view.endEditing(true)
        
        let toast = HJToast()
        toast.backgroundColor = UIColor(red: 191.0/255.0, green: 54.0/255.0, blue: 12.0/255.0, alpha: 1.0)
        
        let leftBtn = UIButton(type: .system)
        leftBtn.setTitle("Left", for: UIControlState())
        leftBtn.setTitleColor(UIColor(red: 255.0/255.0, green: 171.0/255.0, blue: 145.0/255.0, alpha: 1.0), for: UIControlState())
        
        toast.leftView = leftBtn
        
        toast.bakeToast(withMessage: "Hey there! It's me...", inView: view)
    }
    
    @IBAction func showRightComponent(_ sender: AnyObject) {
        view.endEditing(true)
        
        let toast = HJToast()
        toast.backgroundColor = UIColor(red: 191.0/255.0, green: 54.0/255.0, blue: 12.0/255.0, alpha: 1.0)
        
        let rightBtn = UIButton(type: .system)
        rightBtn.setTitle("Right", for: UIControlState())
        rightBtn.setTitleColor(UIColor(red: 255.0/255.0, green: 171.0/255.0, blue: 145.0/255.0, alpha: 1.0), for: UIControlState())
        
        toast.rightView = rightBtn
        
        toast.bakeToast(withMessage: "Hey there! It's me...", inView: view)
    }
    
    @IBAction func showAllComponent(_ sender: AnyObject) {
        view.endEditing(true)
        
        let toast = HJToast()
        toast.backgroundColor = UIColor(red: 191.0/255.0, green: 54.0/255.0, blue: 12.0/255.0, alpha: 1.0)
        
        let leftBtn = UIButton(type: .system)
        leftBtn.setTitle("Left", for: UIControlState())
        leftBtn.setTitleColor(UIColor(red: 255.0/255.0, green: 171.0/255.0, blue: 145.0/255.0, alpha: 1.0), for: UIControlState())
        
        toast.leftView = leftBtn
        
        
        let rightBtn = UIButton(type: .system)
        rightBtn.setTitle("Right", for: UIControlState())
        rightBtn.setTitleColor(UIColor(red: 255.0/255.0, green: 171.0/255.0, blue: 145.0/255.0, alpha: 1.0), for: UIControlState())
        
        toast.rightView = rightBtn
        
        toast.bakeToast(withMessage: "Hey there! It's me...", inView: view)
    }
    
    //MARK: - UITextFieldDelegate Methods
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if range.location == 1 {
            return false
        }
        
        return true
    }

}

