//
//  VisitedPlacesViewController.swift
//  Places
//
//  Created by Iyin Raphael on 8/2/18.
//  Copyright © 2018 Lambda Inc. All rights reserved.
//

import UIKit

class VisitedPlacesViewController: UIViewController, PlacesPresenter, PlacesTableViewControllerDelegate {
    func placeWasSelected(place: Place) {
        mapViewController.location = place.location
    }
    

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? PlacesPresenter {
            vc.placeController = placeController
        }
        
        if let tableVc = segue.destination as? PlacesTableViewController{
            placesTableViewController = tableVc
            placesTableViewController.delegate = self
        }
        if let mapVC = segue.destination as? MapViewController {
            mapViewController = mapVC
        }
        
    }
    var placeController: PlaceController?
    var mapViewController: MapViewController!
    var placesTableViewController: PlacesTableViewController!

}
