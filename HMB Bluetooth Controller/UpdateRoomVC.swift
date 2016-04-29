//
//  UpdateRoom.swift
//  HMB Bluetooth Controller
//
//  Created by Mohsin on 10/02/2015.
//  Copyright (c) 2015 HMB-TEC. All rights reserved.
//

import UIKit

class UpdateRoomVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var imgRoom: UIImageView!
    @IBOutlet weak var txtName: UITextField!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    
    
    
    var imgRoomVarString = String()
    var nameVAR = String()

    var tableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.pickerView.selectRow(findIndex(roomsTypeGloble, value: imgRoomVarString), inComponent: 0, animated: true)
        
        txtName.layer.cornerRadius = 6.0
        txtName.layer.borderColor = redColor.CGColor
        txtName.layer.borderWidth = 1.0
        
        
        print(nameVAR)
        
        if UIImage(named: self.imgRoomVarString) != nil {
            let img = UIImage(named: self.imgRoomVarString)!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
            self.imgRoom.image = img

        }
        
        self.imgRoom.tintColor = redColor
        //        self.imgDevice.tintColor = redColor
        
        self.txtName.text = self.nameVAR
        
    }
    

    
    @IBAction func valueChanged(sender: UITextField) {
        
        // if room name already exist
        if roomsGloble[sender.text!] != nil {
            let errorAlert = UIAlertController(title: "EROOR!", message:  "The room name \"\(self.txtName.text)\" is already exist please use differnt name.", preferredStyle: .Alert)
            
            let backAction = UIAlertAction(title: "BACK", style: .Default, handler: nil)
            errorAlert.addAction(backAction)
            self.presentViewController(errorAlert, animated: true, completion: nil)
        }
        else {
            roomsGloble[sender.text!] = imgRoomVarString
            
            let temp = homeArchGloble[self.nameVAR]
            
            homeArchGloble[sender.text!] = temp
            
            // save the name of the room has been changed
            selectedRoomNameGloble = sender.text!
            
            if sender.text! != nameVAR{
                roomsGloble.removeValueForKey(self.nameVAR)
                homeArchGloble.removeValueForKey(self.nameVAR)
            }
            
            nameVAR = sender.text!
            
            self.view.endEditing(true)
            
            if self.tableView != nil {
                tableView.reloadData()
            }
            
        }

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // returns the number of 'columns' to display.
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // returns the # of rows in each component..
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return roomsTypeGloble.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return roomsTypeGloble[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //lableHeading.text = names[row]
        roomsGloble[self.nameVAR] = roomsTypeGloble[row]
        self.imgRoom.image = UIImage(named: roomsTypeGloble[row])?.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        imgRoomVarString = roomsTypeGloble[row]

        
        tableView.reloadData()
    }

    // dismiss keyboard when press return key
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    // helper function that return the index of the value in array 
    func findIndex(array : [String], value : String)-> Int {
        for x in 0..<array.count {
            if array[x] == value {
                return x
            }
        }
        return 0
    }
    
}
