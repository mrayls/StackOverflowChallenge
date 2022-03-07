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
        
        NavigationView {
            
            VStack {
                
                List {
                    Section(header: Text("Recently Guessed")) {
                        // TODO: Finish populating this section with recently guessed items
                    }
                    
                    Section(header: Text("From API")) {
                        ForEach(viewModel.items, id: \.questionId) { item in
                            NavigationLink(destination: ItemDetailView(viewModel: ItemDetailViewModel(), item: item)) {
                                HStack {
                                    ItemRow(item: item)
                                }
                            }
                        }
                    }
                }
                
                Button("Make Request") {
                    viewModel.makeRequest()
                }
                .padding([.top, .bottom], 10)
                
            }
            .navigationTitle("Question List")
            .navigationBarTitleDisplayMode(.inline)
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .center
            )
        }
        .onAppear { viewModel.makeMockRequest() }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ContentViewModel())
    }
}
