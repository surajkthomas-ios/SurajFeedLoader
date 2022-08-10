//
//  RemoteFeedLoaderTest.swift
//  EssentialFeedTests
//
//  Created by suraj thomas on 10/08/22.
//

import XCTest


class RemoteFeedLoader {
    
}

class HTTPCLIENT {
    var requestedUrl:URL?
}

class RemoteFeedLoaderTest: XCTestCase {

    func test_initDoesnotRequestDataFromUrl (){
        
        let _ = RemoteFeedLoader ()
        let client = HTTPCLIENT ()
        XCTAssertEqual(client.requestedUrl, nil)
    }

}
