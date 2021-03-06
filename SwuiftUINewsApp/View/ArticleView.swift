//
//  ArticleView.swift
//  SwuiftUINewsApp
//
//  Created by Takasur Azeem on 21/01/2022.
//

import SwiftUI
import URLImage

struct ArticleView: View {
    
    @State var isLoading: Bool
    let article: Article
    
    var body: some View {
        HStack {
            if let strImageUrl = article.image,
               let imageUrl = URL(string: strImageUrl) {
                URLImage(imageUrl, identifier: article.id.uuidString) { error, retry in
                    PlaceHolderImageView()
                } content: { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .environment(\.urlImageOptions, URLImageOptions(
                            fetchPolicy:
                                    .returnStoreElseLoad(downloadDelay: 1)
                        ))
                }
                .frame(width: 100, height: 100)
                .cornerRadius(10)
            } else {
                PlaceHolderImageView()
            }
            VStack(alignment: .leading, spacing: 4) {
                Text(article.title ?? "")
                    .foregroundColor(Theme.textColour)
                    .font(.system(size: 18, weight: .semibold))
                Text(article.source ?? "N/A")
                    .foregroundColor(.gray)
                    .font(.footnote)
                if let date = article.date {
                    HStack(spacing: 4) {
                        Text(date, style: .date)
                            .foregroundColor(.gray)
                            .font(.system(size: 12, weight: .bold))
                        Text(date, style: .time)
                            .foregroundColor(.gray)
                            .font(.system(size: 12))
                    }
                }
            }
        }
        .redacted(reason: isLoading ? .placeholder : [])
        .allowsHitTesting(!isLoading)
    }
}

struct PlaceHolderImageView: View {
    var body: some View {
        Image(systemName: "photo.fill")
            .foregroundColor(.white)
            .background(.gray)
            .frame(width: 100, height: 100)
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(isLoading: false, article: Article.dummyArticles.first!)
            .previewLayout(.sizeThatFits)
    }
}
