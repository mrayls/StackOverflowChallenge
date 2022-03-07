//
//  CleverName.swift
//  StackOverflowChallenge
//
//  Created by Matt Rayls on 3/3/22.
//

import Foundation

class ContentViewModel: ObservableObject {
    @Published var soRequest: SORequest?
    @Published var items: [Item] = []
    
    func makeMockRequest() {
        self.items.removeAll()
        
        if let path = Bundle.main.path(forResource: "test", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                
                if let parsedRequest = Parser.parseRequest(witData: data) {
                    DispatchQueue.main.async {
                        self.items.append(contentsOf: parsedRequest.items.filter({ $0.isAnswered && $0.answerCount > 1 }))
                    }
                }
            } catch let error {
                print(String(describing: error))
            }
        }
    }
    
    func makeRequest() {
        self.items.removeAll()
        
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
            
            if let parsedRequest = Parser.parseRequest(witData: data) {
                DispatchQueue.main.async {
                    //                    self.items.append(contentsOf: parsedRequest.items)
                    self.items.append(contentsOf: parsedRequest.items.filter({ $0.isAnswered && $0.answerCount > 1 }))
                }
            }
        })
        
        task.resume()
    }
}
