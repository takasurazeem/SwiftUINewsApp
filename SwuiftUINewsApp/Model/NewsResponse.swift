//
//  NewsResponse.swift
//  SwuiftUINewsApp
//
//  Created by Takasur Azeem on 19/01/2022.
//


import Foundation

// MARK: - NewsResponse
struct NewsResponse: Codable {
    let articles: [Article]?
}

// MARK: - Article
struct Article: Codable {
    let author: String?
    let url: String?
    let source, title: String?
    let articleDescription: String?
    let image: String?
    let date: Date?
    
    enum CodingKeys: String, CodingKey {
        case author, url, source, title
        case articleDescription = "description"
        case image, date
    }
}


extension Article: Identifiable, Equatable {
    /// For SwiftUI List
    var id: UUID {
        UUID()
    }
}

extension Article {
    
    static var dummyArticles: [Article] {
        Array(repeating: Article(
            author: "Andrew E. Kramer",
            url: "https://www.nytimes.com/live/2022/01/27/world/ukraine-russia-us",
            source: "New York Times",
            title: "Latest on Russia-Ukraine Tensions: Live Updates - The New York Times",
            articleDescription: "There was no immediate sign of a connection between the shooting and Russia’s military buildup at the border. The incident came hours after the U.S. offered a written response to Russian demands over Eastern Europe.",
            image: "https://static01.nyt.com/images/2022/01/27/world/27ukraine-shooting-01/27ukraine-shooting-01-facebookJumbo.jpg",
            date: Date()
        ), count: 10)
    }
    
}
