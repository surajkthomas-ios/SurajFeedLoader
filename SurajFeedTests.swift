//
//  SurajFeedTests.swift
//  SurajFeed
//
//  Created by suraj thomas on 19/10/21.
//

import XCTest

class SurajFeedTests: XCTestCase {

    class RemoteFeedLoader {
        
        func load {}
    }

    
    func test_init (){
        
        let sut = RemoteFeedLoader
        sut.load()
    }

}
