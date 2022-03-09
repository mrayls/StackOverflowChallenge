//
//  ResultView.swift
//  StackOverflowChallenge
//
//  Created by Matt Rayls on 3/9/22.
//

import SwiftUI

struct ResultView: View {
    let gotRightAnswer: Bool
    
    var body: some View {
        VStack {
            Divider()
            Text(gotRightAnswer ? "You got the right answer! ✅ ✅ ✅ " : "❌ Wrong Answer ❌")
            Divider()
        }
        .background(gotRightAnswer ? .green : .red)
        .transition(.move(edge: .top))
        .transition(.opacity)
        .animation(.easeInOut, value: 0.5)
    }
}
