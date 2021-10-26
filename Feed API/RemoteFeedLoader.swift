//
//  RemoteFeedLoader.swift
//  FeedLoader
//
//  Created by suraj thomas on 26/10/21.
//

import Foundation



public protocol HTTPClient {
    
    func get(from url : URL)
    
}


public final class RemoteTestFeeder{
    
 private   let client : HTTPClient
  private  let url : URL
    
  public  func  loadtest (client : HTTPClient){
        
        
        client.get( from : url)
  
     }
    
    
 public   init(client : HTTPClient , url : URL){
        
        self.client = client
        self.url = url
        
    }
}
