//
//  DataFactory.swift
//  NewsApp
//
//  Created by Jin Zhang on 9/13/25.
//

import Foundation

protocol NewsDataSource {
    func fetchNewsData() async throws-> [Article]
}

enum DataFactory {
    case fakeDatabase
    case apiData
    case dataFacade
}

class NewsFactory {
    static func create(type: DataFactory) -> NewsDataSource {
        switch type{
        case .fakeDatabase:
            return FakeDatabase()
        case .apiData:
            return NewsApi()
        case .dataFacade:
            return DataFacade()
            
        }
    }
    
}
