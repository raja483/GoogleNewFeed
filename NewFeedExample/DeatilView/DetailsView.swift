//
//  DetailsView.swift
//  NewFeedExample
//
//  Created by Venkat Pericharla on 21/12/21.
//

import SwiftUI

struct DetailsView: View {
    
    let article: Article
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        
        WebView(urlString: article.url ?? "")
            .navigationTitle("Details View")
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading, content: {
                    Button("Back"){
                        self.presentationMode.wrappedValue.dismiss()
                    }
                })
            }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(article: Article(source: Source(id: "", name: ""), author: "", title: "", description: "", url: "", urlToImage: "", publishedAt: " ", content: ""))
    }
}
