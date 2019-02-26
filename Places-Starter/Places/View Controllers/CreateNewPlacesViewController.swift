//
//  CreateNewPlacesViewController.swift
//  Places
//
//  Created by Iyin Raphael on 8/2/18.
//  Copyright © 2018 Lambda Inc. All rights reserved.
//

import UIKit

class CreateNewPlacesViewController: UIViewController, PlacesPresenter {
    
    var  placeController: PlaceController?
    
    @IBAction func createNewPlace(_ sender: Any) {
        guard let name = nameTextField.text,
        let latitudeString = latitudeTExtField.text,
        let latitude = Double(latitudeString),
        let longitudeString = longitudeTExtField.text,
        let longitude = Double(longitudeString) else {return}
        
        placeController?.createPlace(withName: name, latitude: latitude, longitude: longitude)
        
    }
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var latitudeTExtField: UITextField!
    @IBOutlet weak var longitudeTExtField: UITextField!
    
}
