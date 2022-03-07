//
//  AnswerRow.swift
//  StackOverflowChallenge
//
//  Created by Matt Rayls on 3/7/22.
//

import SwiftUI

struct AnswerRow: View {
    let answer: Answer
    
    var body: some View {
        HStack {
            Text(answer.bodyMarkdown)
        }
        .frame(
              minWidth: 0,
              maxWidth: .infinity,
              minHeight: 0,
              maxHeight: .infinity,
              alignment: .leading
            )
        .background(Color.gray.opacity(0.1))
        .cornerRadius(5)
    }
}
