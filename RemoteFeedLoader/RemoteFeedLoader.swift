//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by suraj thomas on 18/11/21.
//

import Foundation

public class RemoteFeedLoader {
     
    public enum Error:Swift.Error {
        case connectivityError
    }
    
    private   let client : HTTPClient?
    private    let url : URL?
    public   init(Client:HTTPClient,url : URL) {
        
        self.client = Client
        self.url = url
        
    }
    public    func load (completion:(Error) -> Void = { _ in }) {
        
        client?.GetfromUrl(url: self.url!)
        
    }
}
public protocol HTTPClient {
    func GetfromUrl (url :URL)
    
}
