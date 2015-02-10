//
//  EmptyScreen1VC.swift
//  HMB Bluetooth Controller
//
//  Created by Mohsin on 08/02/2015.
//  Copyright (c) 2015 HMB-TEC. All rights reserved.
//

import UIKit

class EmptyScreen1VC: UIViewController, UIPopoverPresentationControllerDelegate {

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.

    
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func add(sender: AnyObject) {

        var url  = NSURL(string: "http://shop.hmb-tec.de/")
        if UIApplication.sharedApplication().canOpenURL(url!) == true  {
            UIApplication.sharedApplication().openURL(url!)
        }


    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
