//
//  MapVC.swift
//  CarServiceInfo
//
//  Created by ALEKSEY SAMOYLOV on 10/15/16.
//  Copyright © 2016 ALEKSEY SAMOYLOV. All rights reserved.
//

import UIKit
import MapKit
import GoogleMaps
import CoreLocation

class MapVC: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: GMSMapView!
    
    let regionRadius: CLLocationDistance = 10000
    
    var locationManager = CLLocationManager()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        self.locationManager.distanceFilter = 100
        self.locationManager.requestWhenInUseAuthorization()
        //locationManager.requestAlwaysAuthorization()
        //locationManager.startUpdatingLocation()
        
        // set initial location in Perm
        let camera = GMSCameraPosition.camera(withLatitude: LATITUDE_PERM,
                                              longitude: LONGITUDE_PERM, zoom: 10)
        self.mapView.camera = camera
        //let initialLocation = CLLocation(latitude: LATITUDE_PERM, longitude: LONGITUDE_PERM)
        //centerMapOnLocation(initialLocation)
        
        //mapView.delegate = self
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2DMake(LATITUDE_PERM, LONGITUDE_PERM)
        marker.title = "Пермь"
        marker.snippet = "Россия"
        marker.map = mapView

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - CLLocationManagerDelegate
    private func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        // 3
        if status == .authorizedWhenInUse {
            
            // 4
            self.locationManager.startUpdatingLocation()
            
            //5
            self.mapView.isMyLocationEnabled = true
            self.mapView.settings.myLocationButton = true
        }
    }
    
    // 6
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            
            // 7
            mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
            
            // 8
            locationManager.stopUpdatingLocation()
        }
        
    }

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
