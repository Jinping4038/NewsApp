//
//  NetworkError.swift
//  NewsApp
//
//  Created by Jin Zhang on 9/13/25.
//

import Foundation
enum NetworkError: Error{
    case invalidURL
    case invalidResponse
    case invalidResponseCode
    case noData
}

extension NetworkError: LocalizedError {
    var errorDescription: String?{
        switch self {
        case .invalidURL:
            return "The URL is invalid."
        case .invalidResponse:
            return "Invalid response."
        case .invalidResponseCode:
            return "Invalid response code."
        case .noData:
            return "No data from API."
        }
    }
}
