//
//  UpdateDeviceVC.swift
//  HMB Bluetooth Controller
//
//  Created by Mohsin on 10/02/2015.
//  Copyright (c) 2015 HMB-TEC. All rights reserved.
//

import UIKit

class UpdateDeviceVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var imgDevice: UIImageView!
    @IBOutlet weak var txtName: UITextField!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    
    
    
    var imgDeviceVarString = String()
    var nameVAR = String()
    var selectedRoomName = String()
    
    
    var tableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.pickerView.selectRow(findIndex(deviceTypeGloble, value: imgDeviceVarString), inComponent: 0, animated: true)
        
        txtName.layer.cornerRadius = 6.0
        txtName.layer.borderColor = redColor.CGColor
        txtName.layer.borderWidth = 1.0
        
        
        println(selectedRoomName)
        
        if UIImage(named: self.imgDeviceVarString) != nil {
            let img = UIImage(named: self.imgDeviceVarString)!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
            self.imgDevice.image = img
            
        }
        
        self.imgDevice.tintColor = redColor
        //        self.imgDevice.tintColor = redColor
        
        self.txtName.text = self.nameVAR
        
    }
    
    
    
    @IBAction func valueChanged(sender: UITextField) {
        
        // if device name already exist in the given room
        if homeArchGloble[selectedRoomName]![sender.text!] != nil {
            let errorAlert = UIAlertController(title: "EROOR!", message:  "The devive name \"\(self.txtName.text)\" is already exist please use differnt name.", preferredStyle: .Alert)
            
            let backAction = UIAlertAction(title: "BACK", style: .Default, handler: nil)
            errorAlert.addAction(backAction)
            self.presentViewController(errorAlert, animated: true, completion: nil)
        }
        else {
            homeArchGloble[selectedRoomName]![sender.text!] = imgDeviceVarString
            if sender.text! != nameVAR{
                homeArchGloble[selectedRoomName]!.removeValueForKey(nameVAR)
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
        return deviceTypeGloble.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return deviceTypeGloble[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //lableHeading.text = names[row]
        homeArchGloble[selectedRoomName]![self.nameVAR] = deviceTypeGloble[row]
        self.imgDevice.image = UIImage(named: deviceTypeGloble[row])?.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        tableView.reloadData()

    }
    
    // dismiss keyboard when press return key
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.txtName.resignFirstResponder()
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
