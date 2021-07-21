//
//  NewsResponse.swift
//  News App
//
//  Created by TI Digital on 20/07/21.
//

import Foundation

//// MARK: - Welcome
//struct NewsResponse: Codable {
//    let articles: [Article]
//}
//
//// MARK: - Article
//struct Article: Codable, Identifiable {
//    let id = UUID()
//    let author: String?
//    let url: String?
//    let source, title, articleDescription: String
//    let image: String?
//    let date: Date?
//
//    enum CodingKeys: String, CodingKey {
//        case author, url, source, title
//        case articleDescription = "description"
//        case image, date
//    }
//}

// MARK: - NewsResponse
struct NewsResponse: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable, Identifiable {
    let id = UUID()
    let source: Source
    let author: String?
    let title: String
    let articleDescription: String?
    let url: String
    let urlToImage: String?
    let publishedAt: Date
    let content: String?

    enum CodingKeys: String, CodingKey {
        case source, author, title
        case articleDescription = "description"
        case url, urlToImage, publishedAt, content
    }
}

// MARK: - Source
struct Source: Codable {
    let id: String?
    let name: String
}

extension Article {
    static var dummyData: Article {
        .init(
            source: Source(id: "14045", name: "Kompas"),
            author: "Kenneth Garger",
            title: "Issues face mask",
            articleDescription: "Summer hotspot Provincetown issues face mask advisory after new COVID outbreak - New York Post ",
            url: "A coronavirus outbreak linked to a Cape Cod summer vacation hotspot prompted local health officials on Monday to institute a new mask advisory, a report said.",
            urlToImage: "https://nypost.com/wp-content/uploads/sites/2/2021/07/provincetown-mask-covid-729.jpg?quality=90&strip=all&w=1200",
            publishedAt: Date(),
            content:"Coba")
    }
}
