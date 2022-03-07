//
//  Models.swift
//  StackOverflowChallenge
//
//  Created by Matt Rayls on 3/5/22.
//

import Foundation

struct SORequest: Decodable {
    let items: [Item]
    let hasMore: Bool
    let quotaMax: Int
    let quotaRemaining: Int
}

struct Item: Decodable {
    let tags: [String]
    let isAnswered: Bool
    let viewCount: Int?
    let answerCount: Int
    let score: Int?
    let lastActivityDate: Int?
    let creationDate: Int?
    let questionId: Int
    let title: String
    let body: String
    let link: String
    let owner: Owner
    let answers: [Answer]?
}

struct Answer: Decodable {
    let title: String
    let body: String
    let score: Int
    let isAccepted: Bool
    let answerId: Int
    let owner: Owner
}

struct Owner: Decodable {
    let accountId: Int
    let reputation: Int
    let userId: Int
    let userType: String
    let displayName: String
}
