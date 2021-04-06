//
//  UtilitiesTests .swift
//  GMAPP-Unit-Tests
//
//  Created by Lukasz Stachnik on 18/03/2021.
//

import XCTest

@testable import GMAPP

class UtilityTests : XCTestCase {
    
    func testPostgresDateConverter() {
        XCTAssertTrue(type(of: Helpers.postgresDateToDateConverter(from: "2021-04-28")) == Date.self)
    }
    
    func testDaysUntil() {
        XCTAssertEqual(Helpers.daysUntil(until: Date()), 0)
        XCTAssertEqual(Helpers.daysUntil(until: Calendar.current.date(byAdding: .day, value: 3, to: Date())!), 2)
        XCTAssertEqual(Helpers.daysUntil(until: Calendar.current.date(byAdding: .day, value: -3, to: Date())!), -3)
    }
    
    
}
