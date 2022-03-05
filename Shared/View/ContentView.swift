//
//  ContentView.swift
//  Shared
//
//  Created by Matt Rayls on 3/3/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ContentViewModel
    
    var body: some View {
        Text("Hello, world!")
            .padding()
        
        Button("Make Request") {
            viewModel.makeRequest()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ContentViewModel())
    }
}
