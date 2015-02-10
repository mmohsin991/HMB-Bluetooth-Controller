//
//  RoomVC.swift
//  HMB Bluetooth Controller
//
//  Created by Mohsin on 07/02/2015.
//  Copyright (c) 2015 HMB-TEC. All rights reserved.
//

//
//  HomeVC.swift
//  HMB Bluetooth Controller
//
//  Created by Furqan on 2/6/15.
//  Copyright (c) 2015 PanaCloud. All rights reserved.
//

import UIKit

class RoomVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UIPopoverPresentationControllerDelegate, AddDeviceDelegate  {
    
    
    var selectedRoomName : String!
    var selectedRoomNumber : [Int:Int]!

    var deviceTypes :[String] = ["LAMPE","VENTILATOR","BACKOFEN", "STEHLAMPE", "LED STRIPE", "ROLLO", "MARKISE", "STECKDOSE", "DIVERSES"]
    
    @IBOutlet weak var lblRoomNumber: UILabel!
    @IBOutlet weak var deviceCollectionView: UICollectionView!
    
    var devices = ["DEVICE1": "LAMPE","DEVICE2": "BACKOFEN","DEVICE3": "VENTILATOR","DEVICE4": "MARKISE","DEVICE5": "STECKDOSE"]
    
    var selectedDeviceName : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        // just for center the logo
        let tempButton = UIButton(frame: (CGRect(x: 0, y: 0, width: self.view.frame.size.width/3.555, height: 30)))
        tempButton.addTarget(self, action: "back", forControlEvents: UIControlEvents.TouchUpInside)
        tempButton.setTitle("BACK           ", forState: UIControlState.Normal)
        tempButton.contentEdgeInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        tempButton.setTitleColor(redColor, forState: .Normal)
        
        // set the name of navigation item a/c to room's name
        if selectedRoomName != nil {

            let lblTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 20, height: 50))
            lblTitle.text = selectedRoomName
            lblTitle.textColor = redColor
            
            self.navigationItem.titleView = lblTitle
        }
        
        if selectedRoomNumber != nil {
            lblRoomNumber.text = "\(self.selectedRoomNumber.keys.array[0]+1)/\(self.selectedRoomNumber.values.array[0])"
        }
        
        // set corner of the lblRoomNumber round
        self.lblRoomNumber.layer.cornerRadius = 10.0
        self.lblRoomNumber.layer.masksToBounds = true
        
        // animation to hide the room number
        UIView.transitionWithView(self.lblRoomNumber, duration: 1.5, options: UIViewAnimationOptions.TransitionNone, animations: { () -> Void in
            self.lblRoomNumber.alpha = 0.0
        }, completion: nil)
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: tempButton)
        
//        //Set navigation bar image
//        let logoImageView = UIImageView(frame: CGRectMake(0, 0, 40, 40))
//        logoImageView.image = UIImage(named: "Logo.png")
//        logoImageView.contentMode = .ScaleAspectFit
//        self.navigationItem.titleView = logoImageView
        
        
        //Set navigation bar button
        var barButtons = [
            UIBarButtonItem(image: UIImage(named: "Settings.png"), style: .Plain, target: self, action: "preference"),
            UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "addDevice")
        ]
        self.navigationItem.rightBarButtonItems = barButtons
        
        
    }
    
    
    override func viewWillAppear(animated: Bool) {
        
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return devices.keys.array.count
    }
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("deviceCell", forIndexPath: indexPath) as DeviceCell
        
        let collectionViewWidth = collectionView.bounds.size.width
        
        // select the device image
        cell.img.image = UIImage(named: devices.values.array[indexPath.row])!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        
        cell.img.tintColor = UIColor.lightGrayColor()
        
        // select the device name
        cell.lblName.text = devices.keys.array[indexPath.row]
        cell.lblName.font = UIFont.systemFontOfSize(collectionViewWidth/15)
        
        // set badge
        cell.badge.image = UIImage(named: "bluetooth")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        
        if indexPath.row == 0 || indexPath.row == 2 {
            cell.badge.tintColor = UIColor.blueColor()
        }
        
        
        //cell.backgroundColor = UIColor.grayColor()
        
        
        return cell
    }
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        // select the device
        selectedDeviceName = self.devices.keys.array[indexPath.row]
        let selectedDeviceImgName = self.devices.values.array[indexPath.row]

        
        //let cell = collectionView.cellForItemAtIndexPath(indexPath) as  DeviceCell
        //cell.backgroundColor = UIColor.lightGrayColor()
        
        var menuViewController = storyboard!.instantiateViewControllerWithIdentifier("deviceVCID") as? DeviceVC
        
        
        menuViewController?.modalPresentationStyle = .Popover
        menuViewController?.preferredContentSize = CGSizeMake(260, 340)
        let selectedCell = collectionView.cellForItemAtIndexPath(indexPath) as DeviceCell
        
        menuViewController?.imgDeviceVARString = selectedDeviceImgName
        menuViewController?.nameVAR = selectedDeviceName


        
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
    
    
    
    
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    {
        // NOTE: here is where we say we want cells to use the width of the collection view
        let collectionViewWidth = collectionView.bounds.size.width
        
        // NOTE: here is where we ask our sizing cell to compute what height it needs
        let targetSize = CGSize(width: collectionViewWidth/2.0, height: collectionViewWidth/2.0 )
        return targetSize
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "deviceDetailSeg" {


        }
        if segue.identifier == "addDeviceSeg" {
            
            let detailView = (segue.destinationViewController as UINavigationController).viewControllers[0] as AddDeviceVC
            
            detailView.delegate = self
            
        }
    }
    
    
    func addDevice(name: String, type: String, VC : UIViewController){
        self.devices[name] = type
        VC.dismissViewControllerAnimated(true, completion: nil)
        
        self.deviceCollectionView.reloadData()
    }
    

    
    func addDevice() {

        performSegueWithIdentifier("addDeviceSeg", sender: self)
    }
    func preference() {

        performSegueWithIdentifier("preferenceSeg", sender: self)
    }
    
    func back() {
        
        self.navigationController?.popViewControllerAnimated(true)
    }
}


