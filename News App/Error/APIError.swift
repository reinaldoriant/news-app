//
//  APIError.swift
//  News App
//
//  Created by TI Digital on 20/07/21.
//

import Foundation

//MARK: - APIError
/**
 digunakan untuk template error nya
 ***/
enum APIError: Error {
    case decodingError
    case errorCode(Int)
    case unknown
    
}

//MARK: - APIError
/**
 digunakan untuk menentukan output error nya apa
 ***/
extension APIError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .decodingError:
                return "Failed to decode the object from the service"
        case .errorCode(let code):
            return "\(code) - something went wrong"
        case .unknown:
            return "The error is unknown"
        }
    }
}
