//
//  URLBuilder.swift
//  StackOverflowChallenge
//
//  Created by Matt Rayls on 3/5/22.
//

import Foundation

struct URLBuilder {
    
    static let baseURL = "https://api.stackexchange.com/2.3"
    static let questionsEndpoint = "/questions"
    
    static func getURLString(params: [String: Any] = [:]) -> URL? {
        
        let toDate = Date()
        guard let fromDate = toDate.previousWeekDate() else {
            print("Couldn't get previous month date, returning nil")
            return nil
        }
        
        var components = URLComponents(string: baseURL+questionsEndpoint)
        components?.queryItems = [
            URLQueryItem(name: "site", value: "stackoverflow"),
            URLQueryItem(name: "fromdate", value: fromDate.toEpoch()),
            URLQueryItem(name: "todate", value: toDate.toEpoch())
        ]
        
        return components?.url
    }
}
