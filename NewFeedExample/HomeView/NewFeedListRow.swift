//
//  NewFeedListRow.swift
//  NewFeedExample
//
//  Created by Venkat Pericharla on 20/12/21.
//

import SwiftUI

struct NewFeedListRow: View {
    
    var article: Article
    
    init(article: Article) {
        
        self.article = article
    }
    
    var body: some View {
        
        VStack {
            HStack {
                
                // Image
                AsyncImage(url: article.imageUrl){ image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .clipShape(Circle())
                .frame(width: 50, height: 50)
                
                // Label
                VStack {
                    Text(article.title ?? "").font(Font.system(size: 14, weight: .regular))
                }
                Spacer()
                Image(systemName: "arrow.forward").frame(width: 20, height: 20)
            }
        }
    }
    
}

struct NewFeedListRow_Previews: PreviewProvider {
    static var previews: some View {
        
        let article = Article(source: Source(id: "id", name: "Name"), author: "Test Author", title: "Test Article", description: "Test Description", url: "", urlToImage: "https://s.yimg.com/os/creatr-uploaded-images/2021-12/35687d00-5ff1-11ec-bf6a-4b46920ab28e", publishedAt: "", content: "Content")
        
        
        NewFeedListRow(article: article)
    }
}
