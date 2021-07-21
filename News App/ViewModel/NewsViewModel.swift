//
//  NewsViewModel.swift
//  News App
//
//  Created by TI Digital on 20/07/21.
//

import Foundation
import Combine

protocol  NewsViewModel {
    func getArticle()
}

class NewsViewModelImpl: ObservableObject,NewsViewModel {
    
    private let service: NewsService
    
    private(set) var articles = [Article]()// ini kayak private tapi bisa di akses diluar class
    private var cancellables = Set<AnyCancellable>()
    
    @Published private(set) var state: ResultState = .loading
    
    init(service: NewsService) {
        self.service = service
    }
    func getArticle() {
        
        self.state = .loading
        
        let cancellable = service
            .request(from: .getNews)
            .sink{res in
                switch res{
                    
                case .finished:
                    // kirim balik ke articles
                    self.state = .success(content: self.articles)
            
                case .failure(let error):
                    //kirim ke error
                    self.state = .failed(error: error)
                
                }
            } receiveValue: { response in
                self.articles = response.articles
                print("Response di sini apa \(response)")
            }
        self.cancellables.insert(cancellable)
    }
}
