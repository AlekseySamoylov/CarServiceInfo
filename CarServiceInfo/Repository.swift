//
//  Repository.swift
//  CarServiceInfo
//
//  Created by User on 01.12.16.
//  Copyright © 2016 ALEKSEY SAMOYLOV. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol RepositoryProtocol{
    func getWorkGroups()->[WorkGroup]
    func getWorkByWorkGroupId(_ workGroupId : Int64)->[Work]?
    func getCoordinates()->[MapMarker]
}

protocol RepositoryDelegate{
    func workGroupsLoaded()
    func coordinatesLoaded()
}

class Repository : RepositoryProtocol {
    private var workGroups = [WorkGroup]()
    private var coordinates = [MapMarker]()
    var delegate : RepositoryDelegate?
    
    func getWorkGroups()->[WorkGroup]{
        return workGroups;
    }
    
    func getWorkByWorkGroupId(_ workGroupId : Int64)->[Work]?{
        for group in workGroups{
            if group.id == workGroupId{
                return group.works
            }
        }
        return nil
    }
    
    func getCoordinates()->[MapMarker]{
        return coordinates
    }
    
    func setWorkGroups(jsonString: String){
        workGroups = [WorkGroup](json: jsonString)
        if let watcher = delegate{
            watcher.workGroupsLoaded()
        }
    }
    
    func setCoordinates(jsonString: String){
        coordinates = [MapMarker](json: jsonString)
        if let watcher = delegate{
            watcher.coordinatesLoaded()
        }
    }
}
