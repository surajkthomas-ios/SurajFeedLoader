//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by suraj thomas on 11/11/21.
//

import XCTest

protocol HTTPClient {
    
    
    func GetfromUrl (url :URL)
    
}

class HTTPClientSpy : HTTPClient {
        
    var requestedUrl : URL?

    
  func GetfromUrl (url :URL){
        
        requestedUrl = url
    }
    
}


class RemoteFeedLoader {
    
    let client : HTTPClient?
    
    init(Client:HTTPClient) {
        
        self.client = Client
    }
    
    
    func load () {
        
        client?.GetfromUrl(url: URL(string: "http://somesting.com")!)

    }
}

class RemoteFeedLoaderTests: XCTestCase {

    func test_init_RequestNoDataFromURL (){
        
        
        let client = HTTPClientSpy ()
        _ = RemoteFeedLoader(Client: client)
        XCTAssertNil(client.requestedUrl)
        
    }

    
    func test_Do_RequestNoDataFromURL (){
        
        
        let client = HTTPClientSpy ()
        let sut = RemoteFeedLoader(Client: client)
        sut.load()
        XCTAssertNotNil(client.requestedUrl)
        
        
    }
    
    
    
}
