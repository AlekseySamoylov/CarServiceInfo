//
//  ModelDataUpdater.swift
//  CarServiceInfo
//
//  Created by User on 13.11.16.
//  Copyright © 2016 ALEKSEY SAMOYLOV. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol ModelDataUpdaterProtocol {
    func updateDataToVersion(_ version : String)
    func getNewData()->[Entity]
    var dataUpdater : DataUpdaterProtocol? {get set}
}

class ModelDataUpdater<T> : ModelDataUpdaterProtocol where T:Entity {
    private var newData = [T]()
    var dataUpdater: DataUpdaterProtocol?
    
    
    internal func getNewData() -> [Entity] {
        return [T]()
    }

    final internal func updateDataToVersion(_ version : String) {
        if needDataFromServerForVersion(version){
            Alamofire.request(getUrlForRequest()).responseJSON { response in
                switch response.result {
                case .success(let value):
                    self.newData.removeAll()
                    self.newData = [T](json: "\(value)")
                case .failure(let error):
                    print(error)
                }
            }

        }
        if let updater = dataUpdater{
            updater.updaterReady(self)
        }
    }
    
    func checkForExistingData()->Bool{
        return false
    }
    
    func getUrlForRequest()->URL{
        return URL(fileURLWithPath: "/")
    }
    
    func needDataFromServerForVersion(_ version : String)->Bool
    {
        return false;
    }
}
