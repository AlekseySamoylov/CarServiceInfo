//
//  DataUpdater.swift
//  CarServiceInfo
//
//  Created by User on 13.11.16.
//  Copyright © 2016 ALEKSEY SAMOYLOV. All rights reserved.
//

import Foundation

protocol DataUpdaterProtocol{
    func updaterReady(_ updater : ModelDataUpdaterProtocol)
    func update()
}

class DataUpdater : DataUpdaterProtocol {
    private var readyUpdaterCount = 0
    init(){
        for var updater in modelUpdaters{
            updater.dataUpdater = self;
        }
    }
    
    internal func update() {
        self.readyUpdaterCount = 0
        //get version
        let newVersion = getNewVersion();
        let currentVersion = "0";
        if newVersion != currentVersion{
            for updater in modelUpdaters {
                updater.updateDataToVersion(newVersion)
            }
        }
    }

    internal func updaterReady(_ updater: ModelDataUpdaterProtocol) {
        self.readyUpdaterCount += 1
        if self.readyUpdaterCount == modelUpdaters.count{
            var data = [[Entity]]()
            for updater in modelUpdaters {
                data.append(updater.getNewData())
            }
            //write new data to CoreData
        }
    }

    let modelUpdaters = [ModelDataUpdaterProtocol]()
    
    private func getNewVersion()->String{
        return "1"
    }
}
