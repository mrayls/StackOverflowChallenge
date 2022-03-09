//
//  CleverName.swift
//  StackOverflowChallenge
//
//  Created by Matt Rayls on 3/3/22.
//

import Foundation

class ContentViewModel: ObservableObject {
    @Published var soRequest: SORequest?
    @Published var recentlyGuessedQuestions: [Item] = []
    @Published var items: [Item] = [] {
        didSet {
            populateRecentlyGuessed()
        }
    }
    
    func populateRecentlyGuessed() {
        recentlyGuessedQuestions.removeAll()
        
        if let guessedIds = UserDefaults.standard.value(forKey: Constants.guessedIdsKey) as? [Int] {
            recentlyGuessedQuestions.append(contentsOf: items.filter({ guessedIds.contains($0.questionId) }))
        }
    }
    
    func makeMockRequest() {
        self.items.removeAll()
        
        if let parsedRequest = NetworkManager.makeMockedRequest() {
            DispatchQueue.main.async {
                self.items.append(contentsOf: parsedRequest.items.filter({ $0.acceptedAnswerId != nil && $0.answerCount > 1 }))
            }
        }
    }
    
    func makeRequest() {
        self.items.removeAll()
        
        NetworkManager.makeGetRequest { parsedRequest in
            DispatchQueue.main.async {
                self.items.append(contentsOf: parsedRequest?.items.filter({ $0.acceptedAnswerId != nil && $0.answerCount > 1 }) ?? [])
            }
        }
    }
}
