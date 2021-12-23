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
    @Published var hideProgressView = false
    
    override init() {
        
    }
    
    func getNewFeed() {
        
        let urlStr = "https://newsapi.org/v2/everything?q=Apple&from=2021-12-18&sortBy=popularity&apiKey=24b880a3f8be45e298b8b2b0d4b2e05e"
        
        self.requestHandler.makeRequest(url: urlStr, dataType: NewsFeed.init(status: "", totalResults: 0, articles: [])) {[weak self] result in
            
            DispatchQueue.main.async {
                
                switch result {
                    
                case .success(let data):
                    
                    self?.newFeed = data
                    self?.hideProgressView = true
                    break
                    
                case .failure(let error):
                    
                    print(error.localizedDescription)
                    break
                }
            }
        }
        
    }
    
}
