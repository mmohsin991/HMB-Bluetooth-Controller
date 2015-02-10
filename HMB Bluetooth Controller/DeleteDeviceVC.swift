//
//  DeleteDeviceVC.swift
//  HMB Bluetooth Controller
//
//  Created by Mohsin on 10/02/2015.
//  Copyright (c) 2015 HMB-TEC. All rights reserved.
//

import UIKit


@objc protocol DeleteUpdateDevice{
    func deleteRoom(name : String)
    optional func updateRoom(name : String, type: String)
    
}

class DeleteDeviceVC: UITableViewController, DeleteUpdateDevice, UIPopoverPresentationControllerDelegate {

    var roomName: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Set navigation bar image
        let logoButton = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        logoButton.setImage(UIImage(named:"Logo.png"), forState: UIControlState.Normal)
        logoButton.addTarget(self, action: "lanchWebsite", forControlEvents: UIControlEvents.TouchUpInside)
        self.navigationItem.titleView = logoButton
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return devicesGloble.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as DeleteDeviceCell
        
        // Configure the cell...
        
        // set the delete icon
        cell.btnDelete.setImage(UIImage(named: "delete")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate), forState: UIControlState.Normal)
        cell.btnDelete.imageView?.tintColor = UIColor.redColor()
        
        cell.btnUpdate.setImage(UIImage(named: "update")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate), forState: UIControlState.Normal)
        cell.btnUpdate.imageView?.tintColor = UIColor.blueColor()
        
        
        
        cell.lblName.text = devicesGloble.keys.array[indexPath.row]
        cell.delegate = self
        cell.index = indexPath.row
        
        return cell
    }
    
    
    func deleteRoom(name: String) {
        let deleteAlert = UIAlertController(title: "DELETE!", message:  "Are you sure to delete Device \"\(name)\"?", preferredStyle: .Alert)
        
        let cancelAction = UIAlertAction(title: "CANCEL", style: .Default, handler: nil)
        let deleteAction = UIAlertAction(title: "DELETE", style: UIAlertActionStyle.Default) { (
            aletAction) -> Void in
            devicesGloble.removeValueForKey(name)
            println("delete room: \(name)")
            self.tableView.reloadData()
            
        }
        
        deleteAlert.addAction(cancelAction)
        deleteAlert.addAction(deleteAction)
        
        
        self.presentViewController(deleteAlert, animated: true, completion: nil)
        
    }
    
    func preference() {
        performSegueWithIdentifier("preferenceSeg", sender: self)
    }
    
    
    
    func updateRoom(name: String, type: String) {
        var menuViewController = storyboard!.instantiateViewControllerWithIdentifier("UpdateDeviceVCID") as? UpdateDeviceVC
        
        
        menuViewController?.modalPresentationStyle = .Popover
        menuViewController?.preferredContentSize = CGSizeMake(260, 340)
        
        menuViewController?.imgDeviceVarString = type
        menuViewController?.nameVAR = name
        menuViewController?.tableView = self.tableView
        
        let popoverMenuViewController = menuViewController?.popoverPresentationController
        popoverMenuViewController?.permittedArrowDirections = UIPopoverArrowDirection.allZeros
        popoverMenuViewController?.delegate = self
        popoverMenuViewController?.sourceView = self.view
        
        
        // calculate center for popover
        let x = self.view.center.x - 130.0
        let y = self.view.center.y - 170.0
        
        popoverMenuViewController?.sourceRect = CGRect(origin: CGPoint(x: x, y: y), size: CGSize(width: 260.0, height: 340.0))
        
        
        //popoverMenuViewController?.sourceRect = CGRect(x: 65.0, y: self.view.frame.width/3.2, width: 260.0, height: 340.0)
        
        
        if menuViewController != nil {
            self.presentViewController( menuViewController!, animated: true, completion: nil)
            
        }
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None
    }
    
    
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
    }
    
    func lanchWebsite(){
        var url  = NSURL(string: "http://shop.hmb-tec.de/")
        if UIApplication.sharedApplication().canOpenURL(url!) == true  {
            UIApplication.sharedApplication().openURL(url!)
        }
    }
}


class DeleteDeviceCell : UITableViewCell {
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var btnDelete: UIButton!
    @IBOutlet weak var btnUpdate: UIButton!
    
    var index : Int!
    var type = String()
    
    var delegate : DeleteDeviceVC!
    
    @IBAction func deleteRoom(sender: UIButton) {
        
        delegate.deleteRoom(lblName.text!)
        
        
    }
    @IBAction func updateRoom(sender: AnyObject) {
        delegate.updateRoom(lblName.text!, type: devicesGloble[lblName.text!]!)
    }
    
    
}
