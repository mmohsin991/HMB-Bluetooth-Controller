//
//  HomeVC.swift
//  HMB Bluetooth Controller
//
//  Created by Furqan on 2/6/15.
//  Copyright (c) 2015 PanaCloud. All rights reserved.
//

import UIKit

class HomeVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate  {
    
    
    var rooms = ["room1":"room", "room2":"room", "room3":"room", "room4":"room","room5":"room"]

    var selectedRoomName : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // just for center the logo
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: UIView(frame: (CGRect(x: 0, y: 0, width: self.view.frame.size.width/3.555, height: 30))))
        

        //Set navigation bar image
        let logoImageView = UIImageView(frame: CGRectMake(0, 0, 40, 40))
        logoImageView.image = UIImage(named: "Logo.png")
        logoImageView.contentMode = .ScaleAspectFit
        self.navigationItem.titleView = logoImageView

        
        //Set navigation bar button
        var barButtons = [
            UIBarButtonItem(image: UIImage(named: "Settings.png"), style: .Plain, target: self, action: "preference"),
            UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "addRoom")
        ]
        self.navigationItem.rightBarButtonItems = barButtons
        

        
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rooms.keys.array.count
    }
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("roomCell", forIndexPath: indexPath) as RoomCell
        let collectionViewWidth = collectionView.bounds.size.width
        
        // select the room image
        cell.img.image = UIImage(named: rooms.values.array[indexPath.row])
        
        // select the room name
        cell.lblName.text = rooms.keys.array[indexPath.row]
        
        cell.lblName.font = UIFont.systemFontOfSize(collectionViewWidth/15)
        
//        cell.layer.borderColor = UIColor.grayColor().CGColor
//        cell.layer.borderWidth = 1.0
        
        //cell.backgroundColor = UIColor.grayColor()
        
        return cell
    }
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {

        // select the room
        selectedRoomName = self.rooms.keys.array[indexPath.row]
        
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
            detailView.selectedRoomNumber = [selectedRow:self.rooms.keys.array.count]
        }
        
    }

    
    
    
    func addRoom() {
        performSegueWithIdentifier("addRoomSeg", sender: self)
    }
    func preference() {
        performSegueWithIdentifier("preferenceSeg", sender: self)
    }
    
    
}

