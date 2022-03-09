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
    
    @State var selectedId: Int = -1
    
    var body: some View {
        
        if viewModel.showResults {
            ResultView(gotRightAnswer: viewModel.gotRightAnswer)
        }
        
        ScrollView {
            HStack {
                
                VStack {
                    
                    Text(item.title)
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Divider().background(.mint)
                    
                    Text(item.body.formatHTMLString())
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
                    
                    Divider().background(.mint)
                    
                    Text("Answers")
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 10)
                    
                    if let answers = item.answers {
                        ForEach(answers, id: \.answerId) { answer in
                            
                            AnswerRow(answer: answer, backgroundColor: viewModel.getRowBackgroundColor(rowId: answer.answerId, correctAnswer: item.acceptedAnswerId ?? -999))
                                .onTapGesture {
                                    viewModel.selectingAnswer(answer: answer.answerId)
                                }
                                .alert("Alert", isPresented: $viewModel.showAlert, actions: {
                                    if !viewModel.guessed {
                                        Button("Confirm", role: nil) {
                                            viewModel.makeGuess(correctAnswer: item.acceptedAnswerId ?? -999)
                                            viewModel.saveGuessedQuestion(questionId: item.questionId)
                                        }
                                    }
                                    
                                    Button("Cancel", role: .cancel, action: {})
                                    
                                }, message: {
                                    viewModel.guessed ? Text("Whoa there, you already guessed on this question") : Text("Do you want to select this answer for your guess?")
                                })
                        }
                    }
                }
                .padding([.leading, .trailing, .top], 10)
            }
        }
    }
}
