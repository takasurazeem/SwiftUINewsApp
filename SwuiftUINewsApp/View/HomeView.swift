//
//  HomeView.swift
//  SwuiftUINewsApp
//
//  Created by Takasur Azeem on 19/01/2022.
//

import SwiftUI
import UIKit

struct HomeView: View {
    
    @Environment(\.openURL) var openUrl
    @StateObject var viewModel = NewsViewModelImpl(service: NewsServiceImpl())
    
    init() {
        UITabBar.appearance().unselectedItemTintColor = .gray
        UITabBar.appearance().barTintColor = .lightGray
    }
    
    var body: some View {
        NavigationView {
            Group {
                switch viewModel.state {
                case .loading:
                    ProgressView()
                case .failed(error: let error):
                    ErrorView(error: error, handler: viewModel.getArticles)
                case .success(let articles):
                    TabView {
                        List(articles) { article in
                            ArticleView(article: article)
                                .onTapGesture {
                                    load(url: article.url)
                                }
                        }
                        .navigationTitle(Text("News"))
                        .tabItem {
                            Image(systemName: "newspaper.fill")
                            Text("News Feed")
                        }
                        Text("Settings")
                            .navigationTitle(Text("Settings"))
                            .tabItem {
                                Image(systemName: "gearshape.fill")
                                Text("Settings")
                            }
                    }
                    .accentColor(.black)
                }
            }
        }.onAppear(perform: viewModel.getArticles)
    }
    
    func load(url: String?) {
        guard let link = url,
              let url = URL(string: link) else { return }
        openUrl(url)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
