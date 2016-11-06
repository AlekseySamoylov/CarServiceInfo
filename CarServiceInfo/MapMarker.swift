//
//  MapMarker.swift
//  CarServiceInfo
//
//  Created by User on 27.10.16.
//  Copyright © 2016 ALEKSEY SAMOYLOV. All rights reserved.
//

import Foundation
import GoogleMaps
import SwiftyJSON

enum MarkerType : Int{
    case None = 0x0
    case CentralOffice = 0x1
    case Office = 0x2
    }

extension MarkerType{
    func isIncludeInNumber(_ number:Int) -> Bool{
        return self.rawValue & number > 0
    }

}
/*
 Класс-оболочка для маркеров карты (GMSMarker)
*/
class MapMarker{
    private let marker = GMSMarker()
    init(jsonObject : JSON){
        title = jsonObject["name"].string
        snippet = jsonObject["details"].string
        if let lat = jsonObject["latitude"].double{
            latitude = lat
        }
        if let long = jsonObject["longitude"].double{
            longitude = long
        }
        //универсальный код для десериализации
        /*for (key, value) in json {
            let keyName = key as String
            let keyValue: String = value as! String
            
            // If property exists
            if (self.respondsToSelector(NSSelectorFromString(keyName))) {
                self.setValue(keyValue, forKey: keyName)
            }
        }*/
    }
    
    init(_ type:MarkerType){
        self.type = type
    }
    
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
    var title : String?{
        get{
            return self.marker.title
        }
        set{
            self.marker.title = newValue
        }
    }
    var snippet : String?{
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
    var type = MarkerType.None
    
}
