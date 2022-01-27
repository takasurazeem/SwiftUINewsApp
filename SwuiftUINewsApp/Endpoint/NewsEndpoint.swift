//
//  NewsEndpoint.swift
//  SwuiftUINewsApp
//
//  Created by Takasur Azeem on 19/01/2022.
//

import Foundation

protocol APIBuilder {
    var urlRequest: URLRequest { get }
    var baseUrl: URL { get }
    var path: String { get }
}

enum NewsAPI {
    case getNews
}

extension NewsAPI: APIBuilder {
    
    var urlRequest: URLRequest {
        URLRequest(url: baseUrl.appendingPathComponent(path))
    }
    
    var baseUrl: URL {
        switch self {
        case .getNews:
            return URL(string: "https://api.lil.software")!
        }
    }
    
    var path: String {
        "/news"
    }
    
    
}
