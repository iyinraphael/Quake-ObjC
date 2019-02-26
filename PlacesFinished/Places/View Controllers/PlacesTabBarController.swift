//
//  PlacesTabViewController.swift
//  View Controller Containment and UITabBarController
//
//  Created by Spencer Curtis on 6/28/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class PlacesTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for childVC in childViewControllers {
            if let childVC = childVC as? PlacesPresenter {
                childVC.placeController = placeController
            }
        }
    }
    
    let placeController = PlaceController()
}
