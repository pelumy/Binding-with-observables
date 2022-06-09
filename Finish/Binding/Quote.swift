//
//  Quote.swift
//  Binding
//
//  Created by Itunu Raimi on 06/06/2022.
//

import Foundation

struct Quote: Codable {
    let id: String
    let tags: [String]
    let content: String
    let author: String
    let authorSlug: String
    let length: Int
    let dateAdded: String
    let dateModified: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case tags, content, author, authorSlug, length, dateAdded, dateModified
    }
}
