//
//  MarkersProvider.swift
//  CarServiceInfo
//
//  Created by User on 27.10.16.
//  Copyright © 2016 ALEKSEY SAMOYLOV. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

/*
 Протокол для поставщика маркеров
 */
protocol MarkersProviderProtocol{
    func getMarkers()->[MapMarker]
}

/*
 Класс-поставщик маркеров из json массива, полученного в сервера
 */
class MarkersJsonProvider: MarkersProviderProtocol{
    private var markers = [MapMarker]()
    
    init(jsonObjectArray: JSON){
        for marker in jsonObjectArray{
            self.markers.append(MapMarker(jsonObject: marker.1))
        }
    }
    
    
    func getMarkers()->[MapMarker]{
        return self.markers
    }
}
