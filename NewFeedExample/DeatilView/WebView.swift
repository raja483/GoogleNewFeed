//
//  WebView.swift
//  NewFeedExample
//
//  Created by Venkat Pericharla on 21/12/21.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    typealias UIViewType = WKWebView
    let urlString: String
    
    func makeUIView(context: Context) -> WKWebView {
        WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
        if let url = URL(string: urlString) {
            
            let urlReq = URLRequest(url: url)
            uiView.load(urlReq)
        }
    }
    
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        let url = "https://google.com"
        WebView(urlString: url)
    }
}
