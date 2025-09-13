//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by Jin Zhang on 9/13/25.
//

import Foundation
class NewsViewModel {
    var newsList = [Article]()
    let networkManager: NetworkManager
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func getNewsList() async throws {
        do {
            let response: NewsData = try await self.networkManager.fetchNewsDataFromUrl(url: Constant.NewsEndPoint, modelType: NewsData.self)
            self.newsList = response.articles
            print(self.newsList)
            
        } catch {
            print(error.localizedDescription)
            throw error
        }
    }
}
