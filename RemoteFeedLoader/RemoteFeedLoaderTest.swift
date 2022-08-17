//
//  RemoteFeedLoaderTest.swift
//  EssentialFeedTests
//
//  Created by suraj thomas on 10/08/22.
//

import XCTest

 import EssentialFeed


class RemoteFeedLoaderTests: XCTestCase {
    
    func test_init_doesNotRequestDataFromURL() {
        let (_, client) = makeSUT()
        XCTAssertTrue(client.requestedURLS.isEmpty)
    }
    
    func test_load_requestsDataFromURL() {
        let url = URL(string: "https://a-given-url.com")!
        let (sut, client) = makeSUT(url: url)
        
        sut.load()
        
        XCTAssertEqual(client.requestedURLS, [url])
    }
    
    func test_load_requestsDataFromURLTwice() {
        
        let url = URL(string: "https://a-given-url.com")!
        let (sut, client) = makeSUT(url: url)
        
        sut.load()
        sut.load()
        
        XCTAssertEqual(client.requestedURLS, [url,url])
    }
    
    func test_load_deliversClientErrorOnError() {
        let (sut , client) = makeSUT()
        var capturederrors =  [RemoteFeedLoader.Error]()
        
        sut.load{
            capturederrors.append($0)
        }
        let clientError = NSError(domain: "Test", code: 0)
        client.completions[0](clientError)
        
        XCTAssertEqual(capturederrors, [.connectivity])
    }
    
    
    
    // MARK: - Helpers
    
    private func makeSUT(url: URL = URL(string: "https://a-url.com")!) -> (sut: RemoteFeedLoader, client: HTTPClientSpy) {
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(url: url, client: client)
        return (sut, client)
    }

    private class HTTPClientSpy: HTTPClient {
        var requestedURL: URL?
        var requestedURLS = [URL]()
        var completions = [(Error) -> Void]()
        func get(from url: URL,completion : @escaping(Error) -> Void) {
            requestedURL = url
            requestedURLS.append(requestedURL!)
            completions.append(completion)
        }
    }

}
