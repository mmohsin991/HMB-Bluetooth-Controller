//
//  DeleteRoomVC.swift
//  HMB Bluetooth Controller
//
//  Created by Mohsin on 10/02/2015.
//  Copyright (c) 2015 HMB-TEC. All rights reserved.
//

import UIKit

class DeleteRoomVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
        return roomsTypeGloble.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as DeleteRoomCell

        // Configure the cell...
        
        cell.lblName.text = roomsTypeGloble[indexPath.row]
        cell.delegate = tableView
        cell.index = indexPath.row

        return cell
    }



}


class DeleteRoomCell : UITableViewCell {
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var btnDelete: UIButton!
    
    var delegate: UITableView!
    var index : Int!
    
    @IBAction func deleteRoom(sender: UIButton) {

        
        
        var errorAlert = UIAlertController(title: "Error!", message: "", preferredStyle: .Alert)
        var errorAction = UIAlertAction(title: "Cancle", style: .Default, handler: nil)
            
            errorAlert.message = "are you sure to delete room \"\(self.lblName.text)\"?"
            
            errorAlert.addAction(errorAction)


        
        UIAlertAction(title: "Delete", style: .Default) { (alert) -> Void in
            println(self.lblName.text)
            println(sender.titleLabel?.text)
            roomsTypeGloble.removeAtIndex(self.index)
            self.delegate.reloadData()
        }
        
        
//        self.presentViewController(errorAlert, animated: true, completion: nil)
     
        
//        // update UI in main thread
//        dispatch_sync(dispatch_get_main_queue()) {
//            self.presentViewController(errorAlert, animated: true, completion: nil)
//    }
    }
    
}
