//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by suraj thomas on 11/08/22.
//

import Foundation


public class RemoteFeedLoader {
    private    let client: HTTPClient
    private   let url: URL
    
    public  init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }
    
    public   func load() {
        client.get(from: url)
    }
}


public protocol HTTPClient {
    func get(from url: URL)
}
