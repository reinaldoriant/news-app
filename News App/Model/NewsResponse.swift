//
//  NewsResponse.swift
//  News App
//
//  Created by TI Digital on 20/07/21.
//

import Foundation

// MARK: - Welcome
struct NewsResponse: Codable {
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable, Identifiable {
    let id = UUID()
    let author: String?
    let url: String?
    let source, title, articleDescription: String
    let image: String?
    let date: Date?

    enum CodingKeys: String, CodingKey {
        case author, url, source, title
        case articleDescription = "description"
        case image, date
    }
}

extension Article {
    static var dummyData: Article {
        .init(
            author: "Kenneth Garger",
            url: "https://nypost.com/2021/07/19/provincetown-issues-face-mask-advisory-after-new-covid-outbreak/",
            source: "New York Post",
            title: "Summer hotspot Provincetown issues face mask advisory after new COVID outbreak - New York Post ",
            articleDescription: "A coronavirus outbreak linked to a Cape Cod summer vacation hotspot prompted local health officials on Monday to institute a new mask advisory, a report said.",
            image: "https://nypost.com/wp-content/uploads/sites/2/2021/07/provincetown-mask-covid-729.jpg?quality=90&strip=all&w=1200",
            date: Date())
    }
}
