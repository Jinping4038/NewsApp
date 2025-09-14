//
//  CacheManager.swift
//  NewsApp
//
//  Created by Jin Zhang on 9/14/25.
//

import Foundation
class CacheManager {
    private var cachedArticleList : [Article]?
    private var lastUpdate: Date?
    
    func save(_ articles: [Article]){
        cachedArticleList = articles
        lastUpdate = Date()
    }
    
    func getCachedData(expiration: TimeInterval = 60) -> [Article]?{
        guard let cachedData = cachedArticleList,
              let lastUpdateTime = lastUpdate else {
            return nil
        }
        
        if Date().timeIntervalSince(lastUpdateTime) > expiration {
            return nil
        }
        
        return cachedData
    }
    
    func clear(){
        cachedArticleList = nil
        lastUpdate = nil
    }
}
