//
//  SurajFeedLoader.swift
//  SurajFeed
//
//  Created by suraj thomas on 19/10/21.
//

import Foundation

enum SurajFeedResult {
    
    case  success([SurajFeedItem])
    case error(Error)
}

Protocol SurajFeedLoader {
    
    func loadFeed (completion : @escaaping(SurajFeedResult) -> Void)
    
}
