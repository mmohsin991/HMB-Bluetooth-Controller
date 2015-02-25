//
//  PreferenceVC.swift
//  HMB Bluetooth Controller
//
//  Created by Mohsin on 11/02/2015.
//  Copyright (c) 2015 HMB-TEC. All rights reserved.
//

import UIKit

class PreferenceCV: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let doneButton = UIBarButtonItem(title: "DONE", style: UIBarButtonItemStyle.Plain, target: self, action: "done")
        let cancelButton = UIBarButtonItem(title: "CANCEL", style: UIBarButtonItemStyle.Plain, target: self, action: "cancel")
        
        // set color for bar button
        doneButton.tintColor = redColor
        cancelButton.tintColor = redColor
        
        
        // change color and the name of navigation title
        let lblTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 20, height: 50))
        lblTitle.text = "EINSTELLUNGEN"
        lblTitle.textColor = redColor
        
        self.navigationItem.titleView = lblTitle
        
        // add button to navigation item
        self.navigationItem.leftBarButtonItem = doneButton
        self.navigationItem.rightBarButtonItem = cancelButton
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func done() {
        self.navigationController?.popViewControllerAnimated(true)
        
    }
    func cancel() {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func website(sender: UIButton) {
        var url  = NSURL(string: "http://shop.hmb-tec.de/")
        if UIApplication.sharedApplication().canOpenURL(url!) == true  {
            UIApplication.sharedApplication().openURL(url!)
        }
    }
    
    
}

