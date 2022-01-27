//
//  NewsViewModel.swift
//  SwuiftUINewsApp
//
//  Created by Takasur Azeem on 21/01/2022.
//

import Foundation
import Combine

protocol NewsViewModel {
    func getArticles()
}

class NewsViewModelImpl: NewsViewModel, ObservableObject {
    
    private let service: NewsService
    
    private(set) var articles = [Article]()
    private(set) var cancellables = Set<AnyCancellable>()
    
    @Published private(set) var state: ResultState = .loading
    
    init(service: NewsService) {
        self.service = service
    }
    
    func getArticles() {
        state = .loading
        let cancellable = service
            .request(from: .getNews)
            .sink { res in
                switch res {
                case .finished:
                    // send back articles
                    self.state = .success(content: self.articles)
                    break
                case .failure(let error):
                    // send back the error
                    self.state = .failed(error: error)
                }
            } receiveValue: { response in
                self.articles = response.articles!
            }
        cancellables.insert(cancellable)
    }
    
}
