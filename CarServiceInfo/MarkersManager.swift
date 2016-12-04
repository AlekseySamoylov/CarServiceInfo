//
//  MarkersManager.swift
//  CarServiceInfo
//
//  Created by User on 27.10.16.
//  Copyright © 2016 ALEKSEY SAMOYLOV. All rights reserved.
//

import Foundation

/*
 Протокол для делегации управления при изменении списка маркеров
 */
protocol MarkersManagerDelegate{
    func didChangeMarkers(_ markersManager: MarkersManager, changedMarkers:[MapMarker])
}


/*
 Управляющий маркерами класс. Получает маркеры от поставщика и делает с ними какие-либо операции (например фильтрует)
 */
class MarkersManager{
    private let markersProvider : MarkersProviderProtocol;
    init (_ provider : MarkersProviderProtocol){
        self.markersProvider = provider
        self.markers = self.markersProvider.getMarkers()
    }
    
    var delegate : MarkersManagerDelegate?
    var markers : [MapMarker] {
        didSet{
            for oldMarker in oldValue{
                oldMarker.mapView = nil
            }
            if let currentDelegate = delegate{
                currentDelegate.didChangeMarkers(self, changedMarkers: markers);
            }            
        }
    }
    
    
    func update(){
        let newMarkers = self.markers
        self.markers = newMarkers
    }
}
