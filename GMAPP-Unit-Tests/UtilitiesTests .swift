//
//  UtilitiesTests .swift
//  GMAPP-Unit-Tests
//
//  Created by Lukasz Stachnik on 18/03/2021.
//

import XCTest

@testable import GMAPP

class UtilityTests : XCTestCase {
    override func setUp() {
           super.setUp()
        
           // Put setup code here. This method is called before the invocation of each test method in the class.
       }

       override func tearDown() {
           // Put teardown code here. This method is called after the invocation of each test method in the class.
           super.tearDown()
       }
    
    func testPostgresDateConverter() {
        XCTAssertTrue(type(of: Helpers.postgresDateToDateConverter(from: "2021-04-28")) == Date.self)
    }
}
