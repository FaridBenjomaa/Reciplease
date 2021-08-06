//
//  RecipleaseTests.swift
//  RecipleaseTests
//
//  Created by Farid Benjomaa on 05/08/2021.
//

import XCTest
import Alamofire
@testable import Reciplease

class RecipleaseTests: XCTestCase {

    private var sut: RecipesServices!
    let list : [String] = ["egg", "tomatoes", "chicken"]
   
    override func setUp() {
        super.setUp()
    
    
    let manager: Session = {
        let configuration: URLSessionConfiguration = {
            let configuration = URLSessionConfiguration.default
            configuration.protocolClasses = [MockURLProtocol.self]
            return configuration
        }()
        return Session(configuration : configuration)
    }()
    sut = RecipesServices(afmanager: manager, list: list)
    }
    
    override func tearDown() {
        super.tearDown()
        
        sut = nil
    }
    
    func testStatusCode200ReturnsStatusCode200() {
            // given
            MockURLProtocol.responseWithStatusCode(code: 200)
            
            let expectation = XCTestExpectation(description: "Performs a request")
            
            // when
        sut.getRecipe { (true, result) in
            XCTAssertNotNil(result)
            expectation.fulfill()
        }
      
            
            // then
            wait(for: [expectation], timeout: 3)
        }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
