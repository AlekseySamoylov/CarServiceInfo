//
//  MapViewDecorator.swift
//  CarServiceInfo
//
//  Created by User on 06.11.16.
//  Copyright © 2016 ALEKSEY SAMOYLOV. All rights reserved.
//

import Foundation
import GoogleMaps

/*
 Класс-декоратор для GMSMapView. Нужен для абстрагирования от гугловской библиотеки, чтобы вместо GMSMapView мог использоваться MapViewProtocol
 */
class MapViewDecorator : GMSMapView, MapViewProtocol{
}
