//
//  CleverName.swift
//  StackOverflowChallenge
//
//  Created by Matt Rayls on 3/3/22.
//

import Foundation

class ContentViewModel: ObservableObject {
    var request: Request?
    var itemArray: [Item]?
    
    func makeRequest() {
        guard let url = URLBuilder.getURLString() else {
            return print("Couldn't get URL")
        }
        
        var request = URLRequest(url: url )
        request.httpMethod = "GET"
        
        print("*** Starting API call with url: \(url)")

        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { [weak self] data, _, error -> Void in
            
            guard let self = self else { return }
            
            guard error == nil else { return print("Error:\n\(error.debugDescription)")}
            
            if let data = data {
                self.itemArray = Parser.parseQuestions(witData: data)
            }
        })

        task.resume()
    }
}
