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
                        ForEach(viewModel.recentlyGuessedQuestions, id: \.questionId) { item in
                            NavigationLink(destination: ItemDetailView(viewModel: ItemDetailViewModel(), item: item)) {
                                HStack {
                                    ItemRow(item: item)
                                }
                            }
                        }
                    }.onAppear {
                        viewModel.populateRecentlyGuessed()
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
            #if !os(macOS)
            .navigationBarTitleDisplayMode(.inline)
            #endif
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
