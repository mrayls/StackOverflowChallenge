//
//  ItemDetailViewModel.swift
//  StackOverflowChallenge
//
//  Created by Matt Rayls on 3/7/22.
//

import Foundation
import SwiftUI

class ItemDetailViewModel: ObservableObject {
    @Published var showAlert = false
    @Published var gotRightAnswer = false
    @Published var showResults = false
    var guessed = false
    
    var selectedAnswer: Int?
    
    func selectingAnswer(answer: Int) {
        selectedAnswer = answer
        showAlert = true
    }
    
    func makeGuess(correctAnswer: Int) {
        gotRightAnswer = correctAnswer == selectedAnswer
        guessed = true
        showResultsView()
    }
    
    func showResultsView() {
        showResults = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            self.showResults = false
        }
    }
    
    func saveGuessedQuestion(questionId: Int) {
        if var guessedIds = UserDefaults.standard.value(forKey: Constants.guessedIdsKey) as? [Int] {
            
            if !guessedIds.contains(questionId) {
                guessedIds.append(questionId)
                UserDefaults.standard.set(guessedIds, forKey: Constants.guessedIdsKey)
            }
            
        } else {
            UserDefaults.standard.set([questionId], forKey: Constants.guessedIdsKey)
        }
    }
    
    func getRowBackgroundColor(rowId: Int, correctAnswer: Int) -> Color {
        if guessed {
            if rowId == correctAnswer {
                return .green
            }
            
            if rowId == selectedAnswer && selectedAnswer != correctAnswer {
                return .red
            }
        }
        
        return .clear
    }
}
