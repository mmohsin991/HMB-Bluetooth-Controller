//
//  HomeVC.swift
//  HMB Bluetooth Controller
//
//  Created by Furqan on 2/6/15.
//  Copyright (c) 2015 PanaCloud. All rights reserved.
//

import UIKit

class HomeVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate  {
    
    

    // NOTE "FLUR" room image not available
    
    var roomsType = ["BAD", "WC", "KINDERZIMMER", "BALKON", "BÜRO", "KELLER", "ESSZIMMER", "TERRASSE", "HOBBYRAUM"]
    
    var rooms = ["room1":"BAD", "room2":"KINDERZIMMER", "room3":"BALKON", "room4":"WC","room5":"ESSZIMMER"]

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
                
        cell.img.image = UIImage(named: rooms.values.array[indexPath.row]).imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)

        cell.img.tintColor = UIColor.lightGrayColor()
        
        // set badge
        cell.badge.image = UIImage(named: "bluetooth").imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        
        // set bluetooth
        if indexPath.row == 1 || indexPath.row == 4 {
            cell.badge.tintColor = redColor
        }
        
        // select the room name
        cell.lblName.text = rooms.keys.array[indexPath.row]
        cell.lblName.font = UIFont.systemFontOfSize(collectionViewWidth/15)

        //cell.lblBottom.frame = CGRect(x: collectionView.frame.origin.x, y: collectionView.frame.origin.x+collectionViewWidth, width: collectionView.bounds.size.width, height: 1)
        
       // cell.lblBottom. = CGRect(x: 10, y: 10, width: 10, height: 100)
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

