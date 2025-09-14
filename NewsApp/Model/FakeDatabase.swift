//
//  FakeDatabase.swift
//  NewsApp
//
//  Created by Jin Zhang on 9/13/25.
//

import Foundation



class FakeDatabase: NewsDataSource {
    func fetchNewsData() async throws -> [Article] {
        
        let fakeData = NewsData(
                    status: "ok",
                    totalResults: 3,
                    articles: [
                        Article(
                            source: Source(id: "the-wall-street-journal", name: "The Wall Street Journal"),
                            author: "The Wall Street Journal",
                            title: "Big Brands Play Down Their Americanness Abroad - The Wall Street Journal",
                            description: nil,
                            url: "https://www.wsj.com/business/retail/big-brands-play-down-their-americanness-abroad-a7e6db52",
                            urlToImage: nil,
                            publishedAt: "2025-09-13T09:30:00Z",
                            content: nil
                        ),
                        Article(
                            source: Source(id: nil, name: "NPR"),
                            author: "Huo Jingnan",
                            title: "People are losing jobs due to social media posts about Charlie Kirk - NPR",
                            description: "Some GOP officials want to clamp down on perceived expressions of schadenfreude...",
                            url: "https://www.npr.org/2025/09/13/nx-s1-5538476/charlie-kirk-jobs-target-social-media-critics-resign",
                            urlToImage: "https://npr-brightspot.s3.amazonaws.com/a9/02/b4122a9a4571addec344a85f127c/gettyimages-2234381833.jpg",
                            publishedAt: "2025-09-13T09:00:00Z",
                            content: "Over thirty people across the country have been fired..."
                        ),
                        Article(
                            source: Source(id: "business-insider", name: "Business Insider"),
                            author: "Juliana Kaplan",
                            title: "Americans are begging Canadians to come back - Business Insider",
                            description: "Canadians and American border states used to go together like gravy on fries...",
                            url: "https://www.businessinsider.com/americans-businesses-beg-canadian-tourists-come-back-2025-9",
                            urlToImage: "https://i.insider.com/68c476edf9db348adc0b6945?width=1200&format=jpeg",
                            publishedAt: "2025-09-13T08:03:00Z",
                            content: "David Rye has been hearing a lot less French on the mountain bike trails..."
                        )
                    ]
                )
                
                // just return articles, like the API layer does in NewsApi
                return fakeData.articles
            }
    
   
}
