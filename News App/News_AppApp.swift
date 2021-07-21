//
//  News_AppApp.swift
//  News App
//
//  Created by TI Digital on 20/07/21.
//

import SwiftUI
import URLImage
import URLImageStore

@main
struct News_AppApp: App {
    var body: some Scene {
        let urlImageService = URLImageService(fileStore: URLImageFileStore(),
                                              inMemoryStore: URLImageInMemoryStore())
        return WindowGroup {
            HomeView()
                .environment(\.urlImageService, urlImageService)
        }
    }
}
