//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by suraj thomas on 11/08/22.
//

import Foundation


public class RemoteFeedLoader {
    private   let client: HTTPClient
    private   let url: URL
    
    public enum Error : Swift.Error {
        
        case connectivity
    }
    public  init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }
    
    public   func load(completion : (Error) -> Void = { _ in}) {
        client.get(from: url) { error in
            completion(.connectivity)
        }
    }
}


public protocol HTTPClient {
    func get(from url: URL , completion : (Error) -> Void)
}
