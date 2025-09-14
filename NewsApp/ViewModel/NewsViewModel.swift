//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by Jin Zhang on 9/13/25.
//

import Foundation
class NewsViewModel {
    
    var newsList = [Article]()
    private let newsDataSource: NewsDataSource
    init(source: DataFactory){
        self.newsDataSource = NewsFactory.create(type: .DataFacade)
    }
//    let networkManager: NetworkManager
//    
//    init(networkManager: NetworkManager) {
//        self.networkManager = networkManager
//    }
    
    func getNewsList() async throws {
        do {
            let result = try await
            newsDataSource.fetchNewsData()
            self.newsList = result
            
            print(newsList)
            
        } catch {
            print(error.localizedDescription)
            throw error
        }
    }
}
