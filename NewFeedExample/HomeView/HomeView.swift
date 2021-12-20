//
//  ContentView.swift
//  NewFeedExample
//
//  Created by Venkat Pericharla on 18/12/21.
//

import SwiftUI

struct HomeView: View {
    
   @ObservedObject var viewModel: HomeViewModel
    
    
    init(viewModel: HomeViewModel) {
        
        self.viewModel = viewModel
        self.viewModel.getNewFeed()
    }
    
    var body: some View {
        
        NavigationView {
            
            List(self.viewModel.newFeed?.articles ?? [], id: \.title){ article in
                
                NewFeedListRow(article: article)
            }
            .listStyle(.plain)
            .navigationTitle("Google News")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel())
    }
}
