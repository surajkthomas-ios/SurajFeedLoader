//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by suraj thomas on 11/11/21.
//

import XCTest

class HTTPClient {
    
    var requestedUrl : URL?

    
}

class RemoteFeedLoader {
    
}

class RemoteFeedLoaderTests: XCTestCase {

    
    
   
    
    func test_init_RequestNoDataFromURL (){
        
        
        let client = HTTPClient ()
        _ = RemoteFeedLoader ()
        XCTAssertNil(client.requestedUrl)
        
        
    }

    
    
    
}
