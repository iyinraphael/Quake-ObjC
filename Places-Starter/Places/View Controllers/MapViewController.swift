//
//  MapViewController.swift
//  Places
//
//  Created by Andrew R Madsen on 7/26/18.
//  Copyright © 2018 Lambda Inc. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateMapViewLocation()
    }
    
    private func updateMapViewLocation() {
        guard let location = location, isViewLoaded else { return }
        
        let span = MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
        let coordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        
        mapView.setRegion(region, animated: true)
    }

    // MARK: - Properties
    
    var location: (latitude: Double, longitude: Double)? {
        didSet {
            updateMapViewLocation()
        }
    }
    
    @IBOutlet weak var mapView: MKMapView!

}
