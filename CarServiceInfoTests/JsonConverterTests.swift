//
//  JsonConverterTests.swift
//  CarServiceInfo
//
//  Created by User on 16.11.16.
//  Copyright © 2016 ALEKSEY SAMOYLOV. All rights reserved.
//

import XCTest
import Foundation
import Alamofire
import EVReflection
@testable import CarServiceInfo

class JsonConverterTests: XCTestCase {
    private class TestDelegateClass : MarkersManagerDelegate{
        var isDelegateCalled = false
        func didChangeMarkers(_ markersManager: MarkersManager, changedMarkers: [MapMarker]) {
            self.isDelegateCalled = true
        }
    }
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    private func createManager()->MarkersManager{
        let provider = TestMarkersProvider()
        return MarkersManager(provider)
    }
    
    func testgetMarkers_WhenSetFilter_ReturnFilteredMarkers() {
        Alamofire.request("http://www.alekseysamoylov.com:8080/serviceiii/works").responseJSON { response in
            print(response.request)  // original URL request
            print(response.response) // HTTP URL response
            print(response.data)     // server data
            print(response.result)   // result of response serialization
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
            }
        }
    }
}
