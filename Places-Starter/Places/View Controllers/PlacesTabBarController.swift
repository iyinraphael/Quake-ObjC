//
//  PlacesTabBarController.swift
//  Places
//
//  Created by Iyin Raphael on 8/2/18.
//  Copyright © 2018 Lambda Inc. All rights reserved.
//

import UIKit

class PlacesTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        for childVc in childViewControllers {
            if let childVc = childVc as? PlacesPresenter{
                childVc.placeController = placeController
        
            }
        }
    }
  
    
    
    let placeController = PlaceController()

}
