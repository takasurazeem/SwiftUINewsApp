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


extension Article: Identifiable {
    /// For SwiftUI List
    var id: UUID {
        UUID()
    }
}
