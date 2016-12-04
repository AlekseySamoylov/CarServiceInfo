//
//  MapMarker.swift
//  CarServiceInfo
//
//  Created by User on 27.10.16.
//  Copyright © 2016 ALEKSEY SAMOYLOV. All rights reserved.
//

import Foundation
import GoogleMaps
import EVReflection

/*
 Класс-оболочка для маркеров карты (GMSMarker)
*/
class MapMarker : EVObject {
    private let marker = GMSMarker()

    var latitude: Double{
        get{
            return self.marker.position.latitude
        }
        set{
            self.marker.position = CLLocationCoordinate2DMake(newValue, self.longitude)
        }
    }
    var longitude: Double{
        get{
            return self.marker.position.longitude
        }
        set{
            self.marker.position = CLLocationCoordinate2DMake(self.latitude, newValue)
        }
    }
    var name : String?{
        get{
            return self.marker.title
        }
        set{
            self.marker.title = newValue
        }
    }
    var details : String?{
        get{
            return self.marker.snippet
        }
        set{
            self.marker.snippet = newValue
        }
    }
    var mapView : MapViewProtocol?{
        get{
            return self.marker.map as? MapViewProtocol
        }
        set{
            self.marker.map = newValue as? GMSMapView
        }
    }
    
}
