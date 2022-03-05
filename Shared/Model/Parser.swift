//
//  Parser.swift
//  StackOverflowChallenge
//
//  Created by Matt Rayls on 3/5/22.
//

import Foundation

class Parser: NSObject {
    static func parseQuestions(witData data: Data) -> [Item] {
        let items: [Item]
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let request = try decoder.decode(Request.self, from: data)
            items = request.items
        } catch let error {
            print(String(describing: error))
            items = []
        }
        
        return items
    }
}
