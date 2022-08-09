//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by suraj thomas on 11/11/21.
//

import XCTest
import EssentialFeed

class HTTPClientSpy : HTTPClient {
    var requestedUrls = [URL]()
    var requestedUrl : URL?
    func GetfromUrl (url :URL){
        
        requestedUrl = url
        requestedUrls.append(url)
    }
    
}

class RemoteFeedLoaderTests: XCTestCase {
    
    func test_init_RequestNoDataFromURL (){
        let (_,client) = makeSUT()
        XCTAssertNil(client.requestedUrl)
        
    }
    
    
    func test_load_DataFromURL (){
        
        let url = URL(string: "https://someurl.com")
        let (sut,client) = makeSUT(url: url!)
        sut.load()
        XCTAssertEqual(client.requestedUrl, url!)
    }
    
    func test_load_TwiceDataFromURL (){
        
        let url = URL(string: "https://someurl.com")
        let (sut,client) = makeSUT(url: url!)
        sut.load()
        sut.load()
        XCTAssertEqual(client.requestedUrls, [url!,url!])
    }
    
    func test_DeliversClientErrorOnError (){
        
        let (sut,client) = makeSUT()
        var capturedError = RemoteFeedLoader.Error.self
        sut.load{ error in capturedError }
        
    }
    
    
    
    // MARK : helper methods
    
    private func makeSUT (url : URL = URL(string : "http://someurl.com")!) -> (sut : RemoteFeedLoader ,client : HTTPClientSpy) {
        let client = HTTPClientSpy ()
        let sut = RemoteFeedLoader(Client: client, url: url)
        return (sut,client)
    }
    
    
    
    
    
}
