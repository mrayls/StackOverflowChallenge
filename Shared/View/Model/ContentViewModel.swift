//
//  CleverName.swift
//  StackOverflowChallenge
//
//  Created by Matt Rayls on 3/3/22.
//

import Foundation

class ContentViewModel: ObservableObject {
    @Published var items: [Item] = []
    
    func makeRequest() {
        guard let url = URLBuilder.getURLString() else {
            return print("Couldn't get URL")
        }
        
        var urlRequest = URLRequest(url: url )
        urlRequest.httpMethod = "GET"
        
        print("*** Starting API call with url: \(url)")

        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest, completionHandler: { [weak self] data, _, error -> Void in
            
            guard let self = self else { return }
            
            guard error == nil else { return print("Error:\n\(error.debugDescription)")}
            
            let request = Parser.parseRequest(witData: data)
            
            DispatchQueue.main.async {
                self.items.append(contentsOf: request?.items ?? [])
            }
        })

        task.resume()
    }
}
