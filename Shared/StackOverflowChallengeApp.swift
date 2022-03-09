//
//  StackOverflowChallengeApp.swift
//  Shared
//
//  Created by Matt Rayls on 3/3/22.
//

import SwiftUI

@main
struct StackOverflowChallengeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ContentViewModel())
        }
    }
}
