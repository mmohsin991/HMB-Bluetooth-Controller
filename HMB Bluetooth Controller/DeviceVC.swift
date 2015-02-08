//
//  DeviceVC.swift
//  HMB Bluetooth Controller
//
//  Created by Mohsin on 08/02/2015.
//  Copyright (c) 2015 HMB-TEC. All rights reserved.
//

import UIKit

class DeviceVC: UIViewController {
    
    
    @IBOutlet weak var imgDevice: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblExtra: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var switchOn: UISwitch!
    @IBOutlet weak var lblTimer: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
 
        // set the shadow of switchOn button
        self.switchOn.layer.shadowColor = UIColor.darkGrayColor().CGColor
        self.switchOn.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.switchOn.layer.shadowOpacity = 1.0
        self.switchOn.layer.shadowRadius = 3.0
        self.switchOn.layer.masksToBounds = false
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
