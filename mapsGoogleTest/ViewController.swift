//
//  ViewController.swift
//  mapsGoogleTest
//
//  Created by Kant on 09.03.17.
//  Copyright © 2017 Анатолий Подкладов. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        GMSServices.provideAPIKey("AIzaSyC3p4XP7YA6td5wpxXmZlCo137Pe1z--Wc")
        let camera = GMSCameraPosition.camera(withLatitude: 37.621723, longitude: -122.380542, zoom: 12.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
        
        let currentLocation = CLLocationCoordinate2DMake(37.621723, -122.380542)
        let marker  = GMSMarker(position: currentLocation)
        marker.title = "SFO Airport"
        marker.map = mapView
        
    }


}

