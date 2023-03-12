//
//  MockNetworkManager.swift
//  Shopify AdminTests
//
//  Created by Omar on 13/03/2023.
//

import XCTest
@testable import Shopify_Admin
final class MockNetworkManagerTest: XCTestCase {

    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        MockingNetwork.errorFlag = false
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


    func testfetchFromApi(){
        MockingNetwork.fetchFromApi(API_URL: "") { data in
            if let response : Brands? = data {
                XCTAssertNotNil(response)
            }else{
                XCTFail()
            }
        }
    }

}
