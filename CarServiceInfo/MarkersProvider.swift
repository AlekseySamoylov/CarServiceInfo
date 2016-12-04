//
//  MarkersProvider.swift
//  CarServiceInfo
//
//  Created by User on 27.10.16.
//  Copyright © 2016 ALEKSEY SAMOYLOV. All rights reserved.
//

import Foundation

/*
 Протокол для поставщика маркеров
 */
protocol MarkersProviderProtocol{
    func getMarkers()->[MapMarker]
}

/*
 Класс-поставщик маркеров из репозитория данных
 */
class MarkersRepositoryProvider: MarkersProviderProtocol{
    private let repository : RepositoryProtocol
    
    init(repository: RepositoryProtocol){
        self.repository = repository
    }
    
    func getMarkers()->[MapMarker]{
        return repository.getCoordinates()
    }
}
