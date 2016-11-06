//
//  MarkersManagerTests.swift
//  CarServiceInfo
//
//  Created by User on 30.10.16.
//  Copyright © 2016 ALEKSEY SAMOYLOV. All rights reserved.
//

import XCTest
@testable import CarServiceInfo

class MarkersManagerTests: XCTestCase {
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
        let manager = createManager()
        let expectedCount = 4
        
        manager.filter = 2
        
        XCTAssertEqual(expectedCount, manager.markers.count)
    }
    
    func testsetMarkers_WhenChangeFilter_CallDelegate() {
        let manager = createManager()
        let delegate = TestDelegateClass()
        manager.delegate = delegate
        
        manager.filter = 2
        
        XCTAssertTrue(delegate.isDelegateCalled)
    }
    
    func testChangeFilter_WhenOldMarkersDoNotSatisfy_SetOldMarkersMapToNil() {
        let manager = createManager()
        manager.filter = 2
        let marker = manager.markers.first!
        marker.mapView = TestMapView()
        
        manager.filter = 1
        
        XCTAssertNil(marker.mapView)
    }
    
}
