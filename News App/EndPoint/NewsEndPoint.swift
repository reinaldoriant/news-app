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
 //MARK: - api builder
extension NewsAPI: APIBuilder {

    //req api
    var urlRequest: URLRequest {
        return URLRequest(url: self.baseUrl.appendingPathComponent(self.path))
        
    }
    // get data from api web
    var baseUrl: URL {
        switch self {
        case .getNews:
          return URL(string: "https://api.lil.software")!
        }
    }
    
    //this is end of api what we need to access
    var path: String {
        return "/news"
    }
    
    
}

