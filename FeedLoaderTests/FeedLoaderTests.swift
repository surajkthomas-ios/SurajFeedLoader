//
//  FeedLoaderTests.swift
//  FeedLoaderTests
//
//  Created by suraj thomas on 19/10/21.
//

import XCTest
@testable import FeedLoader




class HTTPClientSpy : HTTPClient {
    var requestedURL : URL?
    func get(from url : URL){
        self.requestedURL = url
    }
}


class FeedLoaderTests: XCTestCase {

   
 func   test_init_DoesNotRequsetDataFromURL (){
        
        let url = URL(string: "https://google.com")
        let client = HTTPClientSpy ()
     _ = RemoteTestFeeder (client: client, url:url!)
     XCTAssertNil(client.requestedURL)
        
    }

    func   test_init_RequsetsDataFromURL (){
        
            let url = URL(string: "https://google.com")
            let (sut, client) = makeSUT(url: url!)
//        let sut = RemoteTestFeeder (client: client , url : url!)
            sut.loadtest(client: client)
        
        XCTAssertNotNil(client.requestedURL)
           
       }
    // MARK :- Helpers
     
     private func makeSUT(url : URL) -> (sut : RemoteTestFeeder , client : HTTPClientSpy) {
         
         let client = HTTPClientSpy ()
         let sut = RemoteTestFeeder (client: client, url: url)
         return (sut , client)
         
     }
    
    
}
