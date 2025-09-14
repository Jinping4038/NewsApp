//
//  DataFacade.swift
//  NewsApp
//
//  Created by Jin Zhang on 9/14/25.
//

import Foundation
class DataFacade: NewsDataSource {
    private let networkManager = NetworkManager()
    private let cacheManager = CacheManager()
    
    func fetchNewsData() async throws -> [Article] {
        if let cached = cacheManager.getCachedData() {
            return cached
        }
        
        let fresh = try await networkManager.fetchNewsDataFromUrl(url: Constant.NewsEndPoint, modelType: NewsData.self)

        
        cacheManager.save(fresh.articles)
        
        return fresh.articles
        
    }
    
}
