//
//  EndPoint.swift
//  News App
//
//  Created by TI Digital on 20/07/21.
//

import Foundation

//MARK: - protocol api bulder
/**
 * Protocol sama seperti interface
 *  ( bisa digunakan ketempat lain parameter yang di implement di bawah ini)
 **/
protocol APIBuilder {
    var urlRequest: URLRequest { get }
    var baseUrl: URL { get }
    var path: String { get }
}

//MARK: - enum news api
enum NewsAPI {
    case getNews
}

var id = "2166f40b9b6848ce82773c43d10fed08"

//MARK: - api builder
extension NewsAPI: APIBuilder {
    
    //req api
    var urlRequest: URLRequest {
        var urlComponents = URLComponents(string: self.baseUrl.appendingPathComponent(self.path).absoluteString)
        urlComponents?.queryItems = [
            URLQueryItem(name: "country", value: "us"),
            URLQueryItem(name: "category", value: "business"),
            URLQueryItem(name: "apiKey", value: "2166f40b9b6848ce82773c43d10fed08")
        ]
        print("idnya apa \(id)")
        print("nilainya apa \(urlComponents!)")
        return URLRequest(url: (urlComponents?.url!)!)
    }
    // get data from api web
    var baseUrl: URL {
        switch self {
        case .getNews:
            return URL(string:"https://private-58689-kompasdev1.apiary-mock.com")!
        }
    }
    
    //this is end of api what we need to access
    var path: String {
        return "/v2/top-headlines"
    }
    
    
}

