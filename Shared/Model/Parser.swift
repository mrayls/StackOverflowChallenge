//
//  Parser.swift
//  StackOverflowChallenge
//
//  Created by Matt Rayls on 3/5/22.
//

import Foundation

class Parser {
    static func parseRequest(witData data: Data?) -> SORequest? {
        
        if let data = data {
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let request = try decoder.decode(SORequest.self, from: data)
                return request
            } catch let error {
                print(String(describing: error))
            }
        }
        
        return nil
    }
}
