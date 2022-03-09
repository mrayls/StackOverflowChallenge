//
//  AnswerRow.swift
//  StackOverflowChallenge
//
//  Created by Matt Rayls on 3/7/22.
//

import SwiftUI

struct AnswerRow: View {
    let answer: Answer
    let backgroundColor: Color
    
    var body: some View {
        VStack {
            
            Text(answer.owner.displayName)
                .font(.subheadline)
                .padding([.leading, .trailing, .top, .bottom], 5)
                .foregroundColor(.white)
                .background(.black).opacity(0.8)
                .cornerRadius(5)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(answer.body.formatHTMLString())
                .padding([.leading, .trailing], 5)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .background(backgroundColor)
        .padding([.leading, .trailing, .top, .bottom], 5)
        .cornerRadius(5)
    }
}
