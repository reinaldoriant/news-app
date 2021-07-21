//
//  HomeView.swift
//  News App
//
//  Created by TI Digital on 20/07/21.
//

import SwiftUI

struct HomeView: View {
    
    @Environment (\.openURL) var openUrl
    @StateObject var viewModel = NewsViewModelImpl(service: NewsServiceImpl())
    
    var body: some View {
        Group {
            switch viewModel.state{
            case .loading: // show loading in progress view
                ProgressView()
            case .failed(let error): // failed  we must create error from error view
                ErrorView(error: error, handler: viewModel.getArticle)
            case .success(let articles): // when success show articles
                NavigationView{
                    List(articles){ item in
                        ArticleView(article: item)
                            .onTapGesture {
                                load(url: item.url)
                            }
                    }
                    .navigationTitle(Text(verbatim: "News"))
                }
            }
        }.onAppear(perform: viewModel.getArticle)
    }
    
    func load(url: String?){
        guard let link = url,
              let url = URL(string: link) else {return}
        openUrl(url)
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
