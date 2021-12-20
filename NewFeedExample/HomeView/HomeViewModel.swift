//
//  HomeViewDataModel.swift
//  NewFeedExample
//
//  Created by Venkat Pericharla on 19/12/21.
//

import Foundation

class HomeViewModel: NSObject, ObservableObject {
    
    private let requestHandler = RequestHandler()
    
    @Published var newFeed: NewsFeed?
    
    override init() {
        
    }
    
    func getNewFeed() {
        
        let urlStr = "https://newsapi.org/v2/everything?q=Apple&from=2021-12-18&sortBy=popularity&apiKey=24b880a3f8be45e298b8b2b0d4b2e05e"
        
        self.requestHandler.makeRequest(url: urlStr, dataType: NewsFeed.init(status: "", totalResults: 0, articles: [])) {[weak self] result in
            
            DispatchQueue.main.async {
                
                switch result {
                    
                case .success(let data):
                    
                    self?.newFeed = data
                    break
                    
                case .failure(let error):
                    
                    print(error.localizedDescription)
                    break
                }
            }
        }
        
    }
    
}

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
