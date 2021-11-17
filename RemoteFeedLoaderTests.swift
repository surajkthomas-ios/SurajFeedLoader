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
    let url : URL?
    
    
    init(Client:HTTPClient,url : URL) {
        
        self.client = Client
        self.url = url
        
    }
    
    
    func load () {
        
        client?.GetfromUrl(url: self.url!)

    }
}

class RemoteFeedLoaderTests: XCTestCase {

    func test_init_RequestNoDataFromURL (){
        
        let url = URL(string: "https://someurl.com")

        let client = HTTPClientSpy ()
        _ = RemoteFeedLoader(Client: client, url: url!)
        XCTAssertNil(client.requestedUrl)
        
    }

    
    func test_Do_RequestNoDataFromURL (){
        
        let url = URL(string: "https://someurl.com")
        
        let client = HTTPClientSpy ()
        let sut = RemoteFeedLoader(Client: client, url: url!)
        sut.load()
        XCTAssertEqual(client.requestedUrl, url!)
    }
        
      
        
    
    
    
}
