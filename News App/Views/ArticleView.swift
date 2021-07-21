//
//  ArticleView.swift
//  News App
//
//  Created by TI Digital on 20/07/21.
//

import SwiftUI
import URLImage
import URLImageStore

struct ArticleView: View {
    
    let article: Article
    
    var body: some View {
        HStack {
            if let imgurl = article.urlToImage,
               let url = URL(string: imgurl){
                URLImage(url,
                         failure:{ error, _ in
                    PlaceHolderImageView()
                }, content: { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                .environment(\.urlImageOptions, URLImageOptions(loadOptions: [ .loadOnAppear, .cancelOnDisappear ]))
                         })
                    .frame(width: 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    .cornerRadius(10)

            }
            else{
                PlaceHolderImageView()
            }

            
            VStack(alignment: .leading, spacing: 4){
                Text(article.title )
                    .foregroundColor(.black)
                    .font(.system(size: 18, weight: .semibold))
                Text(article.articleDescription ?? "" )
                    .foregroundColor(.gray)
                    .font(.footnote)
            }
        }
    }
}

struct PlaceHolderImageView: View {
    var body: some View {
        Image(systemName: "photo.fill")
            .foregroundColor(.white)
            .background(Color.gray)
            .frame(width: 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
    }
}
struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(article: Article.dummyData)
            .previewLayout(.sizeThatFits)
    }
}
