//
//  ViewController.swift
//  mapsGoogleTest
//
//  Created by Kant on 09.03.17.
//  Copyright © 2017 Анатолий Подкладов. All rights reserved.
//

import UIKit
import GoogleMaps

class VacationDestination: NSObject {
    
    let name: String
    let location: CLLocationCoordinate2D
    let zoom: Float
    
    init(name: String, location: CLLocationCoordinate2D, zoom: Float) {
        self.name = name
        self.location = location
        self.zoom = zoom
    }
}

class ViewController: UIViewController {
    
    var mapView: GMSMapView?
    
    var currentDestination: VacationDestination?
    
    let destinations = [VacationDestination(name: "Embarcadero Station", location: CLLocationCoordinate2DMake(37.793117, -122.396995), zoom: 15.0), VacationDestination(name: "Ferry Building", location: CLLocationCoordinate2DMake(37.795362, -122.393422), zoom: 18.0)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GMSServices.provideAPIKey("AIzaSyC3p4XP7YA6td5wpxXmZlCo137Pe1z--Wc")
        let camera = GMSCameraPosition.camera(withLatitude: 37.621723, longitude: -122.380542, zoom: 12.0)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
        
        let currentLocation = CLLocationCoordinate2DMake(37.621723, -122.380542)
        let marker  = GMSMarker(position: currentLocation)
        marker.title = "SFO Airport"
        marker.map = mapView
        
        //navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: "next")
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(nextMarker))
        
    }
    
    
    func nextMarker() {
        
        if currentDestination == nil || currentDestination == destinations.last {
            currentDestination = destinations.first
        } else {
            if let index = destinations.index(of: currentDestination!) {
                currentDestination = destinations[index + 1]
            }
        }
        setMapCamera()
    }
    
    private func setMapCamera() {
        CATransaction.begin()
        CATransaction.setValue(2, forKey: kCATransactionAnimationDuration)
        mapView?.animate(to: GMSCameraPosition.camera(withTarget: currentDestination!.location, zoom: currentDestination!.zoom))
        CATransaction.commit()
        
        let marker  = GMSMarker(position: currentDestination!.location)
        marker.title = currentDestination!.name
        marker.map = mapView
    }
    
    
}

