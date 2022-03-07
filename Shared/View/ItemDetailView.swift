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
    let item: Item
    
    var body: some View {
        ScrollView {
            HStack {
                VStack {
                    
                    Text(item.title)
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Divider().background(Color.mint)
                    
                    Text(item.body.htmlToString() ?? "Error: couldn't parse HTML")
                        .font(.body)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack {
                        Text("Asked by: ")
                            .font(.footnote)
                            .foregroundColor(.secondary)
                        Text(item.owner.displayName)
                            .font(.subheadline)
                            .padding([.leading, .trailing, .top, .bottom], 5)
                            .foregroundColor(.white)
                            .background(.black).opacity(0.8)
                            .cornerRadius(5)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
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
        }
    }
}
