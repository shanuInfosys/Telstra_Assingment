//
//  PhotoDataTests.swift
//  Telstra AssingmentTests
//
//  Created by SHANU on 20/11/21.
//

import XCTest
@testable import Telstra_Assingment
class PhotoDataTests: XCTestCase {
    func test_list_of_photos_returns_valid_response() {
        // Arrange
        let photoResource = PhotoResource()
        let expectation = self.expectation(description: "photos_returns_valid_response")
        // Act
        photoResource.getPhotosWithDesc { response in
            // ASSERT
            XCTAssertNotNil(response)
            XCTAssertEqual("About Canada", response?.title)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    func test_networkConnection_should_pass() {
        // ARRANGE
        let networkStatus = Reachability.isConnectedToNetwork()
        XCTAssertTrue(networkStatus)
    }
    func test_networkConnection_should_fail() {
        let networkStatus = Reachability.isConnectedToNetwork()
        XCTAssertFalse(networkStatus)
    }

}
