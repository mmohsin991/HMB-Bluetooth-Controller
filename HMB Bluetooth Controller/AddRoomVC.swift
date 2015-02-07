//
//  AddRoomVC.swift
//  HMB Bluetooth Controller
//
//  Created by Mohsin on 07/02/2015.
//  Copyright (c) 2015 HMB-TEC. All rights reserved.
//

import UIKit

class AddRoomVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func done(sender: UIBarButtonItem) {
        
        // do some before dismiss the view
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func cancel(sender: UIBarButtonItem) {
                self.dismissViewControllerAnimated(true, completion: nil)
    }

    
    @IBAction func QRButton(sender: UIButton) {
        
    }

}
