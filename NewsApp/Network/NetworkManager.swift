//
//  NetworkManager.swift
//  NewsApp
//
//  Created by Jin Zhang on 9/13/25.
//

import Foundation

class NetworkManager {
    let urlSession: URLSession
    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
}

extension NetworkManager: NewsProtocol {
    func fetchNewsDataFromUrl<T>(url: String, modelType: T.Type) async throws -> T where T : Decodable {
        do {
            guard let requestUrl = URL(string: url) else {
                throw NetworkError.invalidURL
            }
            let (data, response) = try await self.urlSession.data(from: requestUrl)
            guard let response = response as? HTTPURLResponse else {
                throw NetworkError.invalidResponse
            }
            
            guard (200...299).contains(response.statusCode) else {
                throw NetworkError.invalidResponseCode
            }
            
            let receivedData = try JSONDecoder().decode(modelType.self, from: data)
            
            return receivedData
        } catch {
            
            if let (data, _) = try? await self.urlSession.data(from: URL(string: url)!) {
                       if let jsonString = String(data: data, encoding: .utf8) {
                           print("⚠️ Decoding failed: \(error)")
                           print("🔍 Raw JSON: \(jsonString)")
                       }
                   }
                   throw error
            
        }
    }
}

class NewsApi: NewsDataSource {
    let networkManager = NetworkManager()
    func fetchNewsData() async throws -> [Article] {
        do {
            let newsdata = try await networkManager.fetchNewsDataFromUrl(url: Constant.NewsEndPoint, modelType: NewsData.self)
            return newsdata.articles
        } catch {
            
            print(error.localizedDescription)
            throw error
            
        }
    }
}
