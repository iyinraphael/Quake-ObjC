//
//  ViewController.swift
//  Notifications
//
//  Created by Iyin Raphael on 8/8/18.
//  Copyright © 2018 Iyin Raphael. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func selectedButton(_ sender: Any) {
        localNotificationHelper.scheduleNotification()
    }
    
    let localNotificationHelper = LocalNotificationHelper()

}

