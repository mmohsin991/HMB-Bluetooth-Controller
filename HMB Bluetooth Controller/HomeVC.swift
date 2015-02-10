//
//  HomeVC.swift
//  HMB Bluetooth Controller
//
//  Created by Furqan on 2/6/15.
//  Copyright (c) 2015 PanaCloud. All rights reserved.
//

import UIKit

class HomeVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate,AddRoomDelegate  {
    
    
    @IBOutlet weak var homeCollectionView: UICollectionView!

    // NOTE "FLUR" room image not available
    
    var roomsType = roomsTypeGloble
    
    var selectedRoomName : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // just for center the logo
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: UIView(frame: (CGRect(x: 0, y: 0, width: self.view.frame.size.width/3.555, height: 30))))
        
        let logoButton = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        logoButton.setImage(UIImage(named:"Logo.png"), forState: UIControlState.Normal)
        logoButton.addTarget(self, action: "lanchWebsite", forControlEvents: UIControlEvents.TouchUpInside)
        self.navigationItem.titleView = logoButton
        
//        //Set navigation bar image
//        let logoImageView = UIImageView(frame: CGRectMake(0, 0, 40, 40))
//        logoImageView.image = UIImage(named: "Logo.png")
//        logoImageView.contentMode = .ScaleAspectFit
//        self.navigationItem.titleView = logoImageView

        
        
        //Set navigation bar button
        var barButtons = [
            UIBarButtonItem(image: UIImage(named: "Settings.png"), style: .Plain, target: self, action: "preference"),
            UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "addRoom")
        ]
        self.navigationItem.rightBarButtonItems = barButtons
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        self.homeCollectionView.reloadData()
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return roomsGloble.keys.array.count
    }
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("roomCell", forIndexPath: indexPath) as RoomCell
        let collectionViewWidth = collectionView.bounds.size.width
        
        // select the room image
        
        if UIImage(named: roomsGloble.values.array[indexPath.row]) != nil {
                    cell.img.image = UIImage(named: roomsGloble.values.array[indexPath.row])!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        }


        cell.img.tintColor = UIColor.lightGrayColor()
        if indexPath.row == 1 || indexPath.row == 4 {
            cell.img.tintColor = redColor
        }
        
        // set badge
        cell.badge.image = UIImage(named: "bluetooth")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        
        // set bluetooth
        if indexPath.row == 0 || indexPath.row == 1 || indexPath.row == 4 {
            cell.badge.tintColor = UIColor.blueColor()
        }
        
        // select the room name
        cell.lblName.text = roomsGloble.keys.array[indexPath.row]
        cell.lblName.font = UIFont.systemFontOfSize(collectionViewWidth/15)

        //cell.lblBottom.frame = CGRect(x: collectionView.frame.origin.x, y: collectionView.frame.origin.x+collectionViewWidth, width: collectionView.bounds.size.width, height: 1)
        
       // cell.lblBottom. = CGRect(x: 10, y: 10, width: 10, height: 100)
        //cell.backgroundColor = UIColor.grayColor()
        
        return cell
    }
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {

        // select the room
        selectedRoomName = roomsGloble.keys.array[indexPath.row]
        
        let cell = collectionView.cellForItemAtIndexPath(indexPath) as RoomCell
        //cell.backgroundColor = UIColor.lightGrayColor()
        
        performSegueWithIdentifier("roomDetailSeg", sender: indexPath.row)
        
    }
    
    func collectionView(collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    {
        // NOTE: here is where we say we want cells to use the width of the collection view
        let collectionViewWidth = collectionView.bounds.size.width
        
        // NOTE: here is where we ask our sizing cell to compute what height it needs
        let targetSize = CGSize(width: collectionViewWidth/2.0, height: collectionViewWidth/2.0)
        return targetSize
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "roomDetailSeg" {
            
            let detailView = segue.destinationViewController as RoomVC
            detailView.selectedRoomName = self.selectedRoomName
            let selectedRow = sender as Int
            detailView.selectedRoomNumber = [selectedRow:roomsGloble.keys.array.count]
        }
        
        if segue.identifier == "addRoomSeg" {
            
            let detailView = (segue.destinationViewController as UINavigationController).viewControllers[0] as AddRoomVC
            
            detailView.delegate = self

        }

        
    }

    func aadRoom(name: String, type: String, VC : UIViewController){
        roomsGloble[name] = type
        VC.dismissViewControllerAnimated(true, completion: nil)
        
        self.homeCollectionView.reloadData()
    }
    
    
    func addRoom() {
        performSegueWithIdentifier("addRoomSeg", sender: self)
    }
    func preference() {
        performSegueWithIdentifier("preferenceSeg", sender: self)
    }
    
    func lanchWebsite(){
        var url  = NSURL(string: "http://shop.hmb-tec.de/")
        if UIApplication.sharedApplication().canOpenURL(url!) == true  {
            UIApplication.sharedApplication().openURL(url!)
        }
    }
    
    
}

