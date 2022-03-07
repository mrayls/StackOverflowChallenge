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
    static let markdownFilter = "!D5qB_bCl3EcR.u-Jj_bB4092.EPad1rHb0EARtXbejXPVtRwz9e"
    
    static func getURLString(params: [String: Any] = [:]) -> URL? {
        
        let toDate = Date()
        guard let fromDate = toDate.previousMonthDate() else {
            print("Couldn't get previous month date, returning nil")
            return nil
        }
        
        var components = URLComponents(string: baseURL+questionsEndpoint)
        components?.queryItems = [
            URLQueryItem(name: "site", value: "stackoverflow"),
            URLQueryItem(name: "pagesize", value: "100"),
            URLQueryItem(name: "fromdate", value: fromDate.toEpochString()),
            URLQueryItem(name: "todate", value: toDate.toEpochString()),
            URLQueryItem(name: "filter", value: markdownFilter)
        ]
        
        return components?.url
    }
}

