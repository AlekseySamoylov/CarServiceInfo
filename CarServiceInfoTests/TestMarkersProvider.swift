//
//  TestMarkersProvider.swift
//  CarServiceInfo
//
//  Created by User on 30.10.16.
//  Copyright © 2016 ALEKSEY SAMOYLOV. All rights reserved.
//

import Foundation
@testable import CarServiceInfo

class TestMarkersProvider : MarkersProviderProtocol{
    func getMarkers() -> [MapMarker] {
        var markers = [MapMarker]()
        markers.append(MapMarker(MarkerType.Office))
        markers.append(MapMarker(MarkerType.Office))
        markers.append(MapMarker(MarkerType.Office))
        markers.append(MapMarker(MarkerType.Office))
        markers.append(MapMarker(MarkerType.CentralOffice))
        markers.append(MapMarker(MarkerType.CentralOffice))
        markers.append(MapMarker())
        return markers
    }
}

class TestMapView : MapViewProtocol{
    
}
 
