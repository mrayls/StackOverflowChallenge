//
//  Models.swift
//  StackOverflowChallenge
//
//  Created by Matt Rayls on 3/5/22.
//

import Foundation

struct Request: Decodable {
    let items: [Item]
    let hasMore: Bool?
    let quotaMax: Int?
    let quotaRemaining: Int?
}

struct Item: Decodable {
    let tags: [String]?
    let isAnswered: Bool?
    let viewCount: Int?
    let answerCount: Int?
    let score: Int?
    let lastActivityDate: Int?
    let creationDate: Int?
    let questionId: Int
    let title: String
    let link: String
    let owner: Owner
}

struct Owner: Decodable {
    let accountId: Int
    let reputation: Int
    let userId: Int
    let userType: String
    let profileImage: String
    let displayName: String
    let link: String
}
