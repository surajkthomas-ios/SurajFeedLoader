//
//  FeedLoaderTests.swift
//  FeedLoaderTests
//
//  Created by suraj thomas on 19/10/21.
//

import XCTest
@testable import FeedLoader


class RemoteTestFeeder{
    
    
  func  loadtest (){}
}


class HTTPClient {
    
    var requestedURL : URL?
}


class FeedLoaderTests: XCTestCase {

   
 func   test_init_DoesNotRequsetDataFromURL (){
        
     let client = HTTPClient()
        let sut = RemoteTestFeeder ()
        sut.loadtest()
     XCTAssertNil(client.requestedURL)
        
    }

}
