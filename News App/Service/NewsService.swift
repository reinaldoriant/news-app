//
//  NewsService.swift
//  News App
//
//  Created by TI Digital on 20/07/21.
//

import Foundation
import Combine

//MARK: - Combine
protocol NewsService {
    //request to get publisher
    /**
            Publisher ini fungsinya adalah kita subcribe data yang ingin kita publish dari api dengan output response dan resultnya
     ***/
    func request(from endpoint: NewsAPI) -> AnyPublisher<NewsResponse, APIError>
}

struct  NewsServiceImpl: NewsService {
    func request(from endpoint: NewsAPI) -> AnyPublisher<NewsResponse, APIError>{
        
        return URLSession
            .shared //untuk shared url session pada sebuah singleton
            .dataTaskPublisher(for: endpoint.urlRequest) // untuk mendapatkan data publisher
            .receive(on: DispatchQueue.main) //menerima secara asychronous
            .mapError{
                _ in APIError.unknown
            } //memetakan map error yang tidak diketahui
            .flatMap{ data, response -> AnyPublisher<NewsResponse,APIError> in
                guard let response = response as? HTTPURLResponse else {
                    return Fail(error: APIError.unknown).eraseToAnyPublisher()
                }
                
                if(200...299).contains(response.statusCode){
                  
                    let jsonDcoder = JSONDecoder()
                    jsonDcoder.dateDecodingStrategy = .iso8601
                    
                    return Just(data)
                        .decode(type: NewsResponse.self , decoder: jsonDcoder)
                        .mapError{
                            _ in APIError.decodingError
                        }
                        .eraseToAnyPublisher()
                }
                else{
                    return Fail(error: APIError.unknown).eraseToAnyPublisher()
                }
                
            }//Mapping response nya
            .eraseToAnyPublisher()//
    }
}
