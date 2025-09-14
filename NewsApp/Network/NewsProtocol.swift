//
//  NewsProtocol.swift
//  NewsApp
//
//  Created by Jin Zhang on 9/13/25.
//

import Foundation
protocol NewsProtocol {
    func fetchNewsDataFromUrl<T: Decodable>(url: String, modelType: T.Type) async throws -> T
}


