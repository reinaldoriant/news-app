//
//  ResultState.swift
//  News App
//
//  Created by TI Digital on 20/07/21.
//

import Foundation

//MARK: - resultstate
/**
  Digunakan untuk menampilkan result dari api
 ***/
enum ResultState {
    case loading
    case success(content: [Article])
    case failed(error: Error)
}
