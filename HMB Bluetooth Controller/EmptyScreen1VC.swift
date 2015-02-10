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
//        
//        var menuViewController = storyboard!.instantiateViewControllerWithIdentifier("UpdateRoomVCID") as? UpdateRoomVC
//        
//        
//        menuViewController?.modalPresentationStyle = .Popover
//        menuViewController?.preferredContentSize = CGSizeMake(260, 340)
//        
//        menuViewController?.imgRoomVarString = ""
//        menuViewController?.nameVAR = "dsa"
//        
//        
//        let popoverMenuViewController = menuViewController?.popoverPresentationController
//        popoverMenuViewController?.permittedArrowDirections = UIPopoverArrowDirection.allZeros
//        popoverMenuViewController?.delegate = self
//        popoverMenuViewController?.sourceView = self.view
//        
//        
//        // calculate center for popover
//        let x = self.view.center.x - 130.0
//        let y = self.view.center.y - 170.0
//        
//        popoverMenuViewController?.sourceRect = CGRect(origin: CGPoint(x: x, y: y), size: CGSize(width: 260.0, height: 340.0))
//        
//        
//        //popoverMenuViewController?.sourceRect = CGRect(x: 65.0, y: self.view.frame.width/3.2, width: 260.0, height: 340.0)
//        
//        
//        if menuViewController != nil {
//            self.presentViewController( menuViewController!, animated: true, completion: nil)
//            
//        }
        
        
        
        
        
        var menuViewController = storyboard!.instantiateViewControllerWithIdentifier("deviceVCID") as? DeviceVC
        
        
        menuViewController?.modalPresentationStyle = .Popover
        menuViewController?.preferredContentSize = CGSizeMake(260, 340)
        
        menuViewController?.imgDeviceVARString = "dsa"
        menuViewController?.nameVAR = "dsa"
        
        
        
        let popoverMenuViewController = menuViewController?.popoverPresentationController
        popoverMenuViewController?.permittedArrowDirections = UIPopoverArrowDirection.allZeros
        popoverMenuViewController?.delegate = self
        popoverMenuViewController?.sourceView = self.view
        
        
        // calculate center for popover
        let x = self.view.center.x - 130.0
        let y = self.view.center.y - 170.0
        
        popoverMenuViewController?.sourceRect = CGRect(origin: CGPoint(x: x, y: y), size: CGSize(width: 260.0, height: 340.0))
        
        
        //popoverMenuViewController?.sourceRect = CGRect(x: 65.0, y: self.view.frame.width/3.2, width: 260.0, height: 340.0)
        
        
        presentViewController( menuViewController!, animated: true, completion: nil)
        


    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None
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
