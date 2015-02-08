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

class RoomVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate  {
    
    
    var selectedRoomName : String!

    
    var devices = ["device1":"device", "device2":"device", "device3":"device", "device4":"device","device5":"device"]
    
    var selectedDeviceName : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // just for center the logo
        let tempButton = UIButton(frame: (CGRect(x: 0, y: 0, width: self.view.frame.size.width/3.555, height: 30)))
        tempButton.addTarget(self, action: "back", forControlEvents: UIControlEvents.TouchUpInside)
        tempButton.setTitle("BACK           ", forState: UIControlState.Normal)
        tempButton.contentEdgeInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        tempButton.setTitleColor(redColor, forState: .Normal)
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: tempButton)
        
        //Set navigation bar image
        let logoImageView = UIImageView(frame: CGRectMake(0, 0, 40, 40))
        logoImageView.image = UIImage(named: "Logo.png")
        logoImageView.contentMode = .ScaleAspectFit
        self.navigationItem.titleView = logoImageView
        
        
        //Set navigation bar button
        var barButtons = [
            UIBarButtonItem(image: UIImage(named: "Settings.png"), style: .Plain, target: self, action: "preference"),
            UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "addDevice")
        ]
        self.navigationItem.rightBarButtonItems = barButtons
        
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return devices.keys.array.count
    }
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("deviceCell", forIndexPath: indexPath) as DeviceCell
        let collectionViewWidth = collectionView.bounds.size.width
        
        // select the device image
        cell.img.image = UIImage(named: devices.values.array[indexPath.row])
        
        // select the device name
        cell.lblName.text = devices.keys.array[indexPath.row]
        
        cell.lblName.font = UIFont.systemFontOfSize(collectionViewWidth/15)
        
        cell.layer.borderColor = UIColor.darkGrayColor().CGColor
        cell.layer.borderWidth = 1.0
        
        //cell.backgroundColor = UIColor.grayColor()
        
        return cell
    }
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        // select the device
        selectedDeviceName = self.devices.keys.array[indexPath.row]
        
        let cell = collectionView.cellForItemAtIndexPath(indexPath) as  DeviceCell
        //cell.backgroundColor = UIColor.lightGrayColor()
        
        
    }
    
    func collectionView(collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    {
        // NOTE: here is where we say we want cells to use the width of the collection view
        let collectionViewWidth = collectionView.bounds.size.width
        
        // NOTE: here is where we ask our sizing cell to compute what height it needs
        let targetSize = CGSize(width: collectionViewWidth/2.02, height: collectionViewWidth/2.2 )
        return targetSize
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "subCategoriesVC" {
            //
            //            let detailView = segue.destinationViewController as SubCategoryList
            //            detailView.categoryName = selectedDeviceName
        }
        
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


