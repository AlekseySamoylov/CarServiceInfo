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
import Alamofire
import SwiftyJSON

class MapVC: UIViewController, CLLocationManagerDelegate, MarkersManagerDelegate {

    @IBOutlet weak var mapView: MapViewDecorator!
    
    let regionRadius: CLLocationDistance = 10000
    
    var locationManager = CLLocationManager()
    var markersManager : MarkersManager?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        self.locationManager.distanceFilter = 100
        self.locationManager.requestWhenInUseAuthorization()
        
        // set initial location in Perm
        let camera = GMSCameraPosition.camera(withLatitude: LATITUDE_PERM,
                                              longitude: LONGITUDE_PERM, zoom: 10)
        self.mapView.camera = camera
        
       
        Alamofire.request(COORDINATES_URL).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                self.markersManager = MarkersManager(MarkersJsonProvider(jsonObjectArray: json))
                self.markersManager!.delegate = self
                self.markersManager?.update()
            case .failure(let error):
                print(error)
            }
        }

        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - CLLocationManagerDelegate
    private func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        // 3
        if status == .authorizedWhenInUse {
            self.locationManager.startUpdatingLocation()
            self.mapView.isMyLocationEnabled = true
            self.mapView.settings.myLocationButton = true
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
            
            locationManager.stopUpdatingLocation()
        }
        
    }

    internal func didChangeMarkers(_ markersManager: MarkersManager, changedMarkers:[MapMarker]){
        for marker in changedMarkers{
            marker.mapView = self.mapView
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
