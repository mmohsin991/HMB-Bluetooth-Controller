//
//  TabBarController.swift
//  HMB Bluetooth Controller
//
//  Created by Mohsin on 08/02/2015.
//  Copyright (c) 2015 HMB-TEC. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        // set clor  programitically
        (self.tabBar.items![0] ).image = UIImage(named: "home")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        (self.tabBar.items![1] ).image = UIImage(named: "tool")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        (self.tabBar.items![2] ).image = UIImage(named: "info")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        (self.tabBar.items![3] ).image = UIImage(named: "delete")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        
        // selected tab bar image color
        self.tabBar.tintColor = redColor
        
        self.tabBar.barTintColor = UIColor.grayColor()
        
        
        // set the tab bar shado 
        self.tabBar.layer.shadowColor = UIColor.grayColor().CGColor
        self.tabBar.layer.shadowOffset = CGSize(width: 0.0, height: -4.0)
        self.tabBar.layer.shadowOpacity = 0.8
        self.tabBar.layer.shadowRadius = 5.0
        self.tabBar.layer.masksToBounds = false

        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
