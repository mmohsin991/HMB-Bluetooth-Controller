//
//  AddDeviceVC.swift
//  HMB Bluetooth Controller
//
//  Created by Mohsin on 07/02/2015.
//  Copyright (c) 2015 HMB-TEC. All rights reserved.
//

import UIKit


protocol AddDeviceDelegate{
    
    func addDevice(name: String, type: String, VC : UIViewController)
    
}

class AddDeviceVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate  {

    var types = ["LAMPE","VENTILATOR","BACKOFEN", "STEHLAMPE", "LED STRIPE", "ROLLO", "MARKISE", "STECKDOSE", "DIVERSES"]

    var delegate : AddDeviceDelegate!
    var selectedRoomName : String!

    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var txtName: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


        
        self.pickerView.selectRow(5, inComponent: 0, animated: true)

        txtName.layer.cornerRadius = 6.0
        txtName.layer.borderColor = redColor.CGColor
        txtName.layer.borderWidth = 1.0
        
        
        // change color and the name of navigation title
        let lblTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 20, height: 50))
        lblTitle.text = "ADD DEVICE"
        lblTitle.textColor = redColor
        
        self.navigationItem.titleView = lblTitle

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
        return self.types.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return self.types[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //lableHeading.text = names[row]
    }
    
    // dismiss keyboard when press return key
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    

    @IBAction func done(sender: UIBarButtonItem) {
        
        let index = self.pickerView.selectedRowInComponent(0)

        // if device name already exist
        if homeArchGloble[self.selectedRoomName!]![self.txtName.text] != nil {
            let errorAlert = UIAlertController(title: "EROOR!", message:  "The device name \"\(self.txtName.text)\" is already exist please use differnt name.", preferredStyle: .Alert)
            
            let backAction = UIAlertAction(title: "BACK", style: .Default, handler: nil)
            errorAlert.addAction(backAction)
            self.presentViewController(errorAlert, animated: true, completion: nil)
        }
        
        else if self.txtName.text != "" {
            self.delegate.addDevice(self.txtName.text, type: self.types[[index][0]], VC: self)
        }
        
       // self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func QRButton(sender: UIButton) {
        println("QR button Press")
    }
    

}
