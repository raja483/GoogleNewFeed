//
//  NewFeedExampleApp.swift
//  NewFeedExample
//
//  Created by Venkat Pericharla on 18/12/21.
//

import SwiftUI

@main
struct NewFeedExampleApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView(viewModel: HomeViewModel())
        }
    }
}
