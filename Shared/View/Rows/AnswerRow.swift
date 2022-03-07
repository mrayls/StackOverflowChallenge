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
            VStack {
                HStack {
                    Text(answer.owner.displayName)
                        .font(.subheadline)
                        .padding([.leading, .trailing, .top, .bottom], 5)
                        .foregroundColor(.white)
                        .background(.black).opacity(0.8)
                        .cornerRadius(5)
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                
                Text(answer.body.htmlToString() ?? "Error: couldn't parse HTML")
            }
            
        }
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .leading
        )
        .cornerRadius(5)
    }
}
