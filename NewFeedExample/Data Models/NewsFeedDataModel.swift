//
//  NewsFeedDataModel.swift
//  NewFeedExample
//
//  Created by Venkat Pericharla on 23/12/21.
//

import Foundation

struct NewsFeed: Codable {
    
    let status: String?
    let totalResults: Int?
    let articles: [Article]?
}

struct Article: Codable {
    
    let source: Source?
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
    
    var imageUrl: URL? {
        
        guard let url = URL(string: self.urlToImage ?? "") else{
            return nil
        }
        
        return url
    }
}

struct Source: Codable {
    let id: String?
    let name: String?
}
