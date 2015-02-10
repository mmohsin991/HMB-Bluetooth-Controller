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

    var types = ["BAD", "WC","KELLER", "KINDERZIMMER", "BALKON", "BURO", "ESSZIMMER", "TERRASSE", "HOBBYRAUM"]

    var tableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.pickerView.selectRow(findIndex(types, value: imgRoomVarString), inComponent: 0, animated: true)
        
        txtName.layer.cornerRadius = 6.0
        txtName.layer.borderColor = redColor.CGColor
        txtName.layer.borderWidth = 1.0
        
        
        println(nameVAR)
        
        if UIImage(named: self.imgRoomVarString) != nil {
            let img = UIImage(named: self.imgRoomVarString)!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
            self.imgRoom.image = img

        }
        
        self.imgRoom.tintColor = redColor
        //        self.imgDevice.tintColor = redColor
        
        self.txtName.text = self.nameVAR
        
    }
    

    
    @IBAction func valueChanged(sender: UITextField) {
        roomsGloble[sender.text!] = imgRoomVarString
        if sender.text! != nameVAR{
            roomsGloble.removeValueForKey(nameVAR)
        }

        nameVAR = sender.text!
        
        self.view.endEditing(true)
        
        if self.tableView != nil {
            tableView.reloadData()
        }
        
        println(roomsGloble)
        
        view.endEditing(true)
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
        return types.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return types[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //lableHeading.text = names[row]
        roomsGloble[self.nameVAR] = types[row]
        self.imgRoom.image = UIImage(named: types[row])?.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
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
