//
//  LoadingIndicatorView.swift
//  NewFeedExample
//
//  Created by Venkat Pericharla on 23/12/21.
//

import Foundation
import SwiftUI


struct LoadingIndicatorView: View {
    
    var body: some View {
        
        ProgressView("Loaing")
            .progressViewStyle(CircularProgressViewStyle(tint: Color.white))
            .frame(width: 80, height: 80, alignment: .center)
            .background(Color.gray)
            .foregroundColor(.white)
            .cornerRadius(5)
    }
}
