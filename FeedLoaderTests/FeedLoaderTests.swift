//
//  FeedLoaderTests.swift
//  FeedLoaderTests
//
//  Created by suraj thomas on 19/10/21.
//

import XCTest
@testable import FeedLoader


class RemoteTestFeeder{
    
    
  func  loadtest (){
      HTTPClient.shared.requestedURL = URL(string: "https://google.com")
  }
}


class HTTPClient {
    
    var requestedURL : URL?
    static let shared = HTTPClient ()
    private init () {}
}


class FeedLoaderTests: XCTestCase {

   
 func   test_init_DoesNotRequsetDataFromURL (){
        
     let client = HTTPClient.shared
        let sut = RemoteTestFeeder ()
        sut.loadtest()
     XCTAssertNil(client.requestedURL)
        
    }

    func   test_init_RequsetDataFromURL (){
           
        let client = HTTPClient.shared
           let sut = RemoteTestFeeder ()
           sut.loadtest()
        XCTAssertNotNil(client.requestedURL)
           
       }
    
}
