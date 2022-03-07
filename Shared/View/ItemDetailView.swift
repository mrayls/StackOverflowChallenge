//
//  ItemView.swift
//  StackOverflowChallenge
//
//  Created by Matt Rayls on 3/5/22.
//

import WebKit
import SwiftUI

struct ItemDetailView: View {
    @ObservedObject var viewModel: ItemDetailViewModel
    @State private var markdownString: AttributedString = ""
    let item: Item
    
    var body: some View {
        ScrollView {
            HStack {
                VStack {
                    
                    Text(item.title)
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Divider().background(Color.mint)
                    
                    Text(markdownString)
                        .font(.body)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("Asked by: \(item.owner.displayName)")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                        .padding([.top, .bottom], 10)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    
                    Divider().background(Color.mint)
                    
                    Text("Answers")
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 10)
                    
                    if let answers = item.answers {
                        ForEach(answers, id: \.answerId) { answer in
                            AnswerRow(answer: answer)
                        }
                    }
                }
            }
            .padding([.leading, .trailing, .top], 10)
        }.onAppear {
            markdownString = viewModel.formatMarkdown(markdown: item.bodyMarkdown) ?? ""
        }
    }
}
