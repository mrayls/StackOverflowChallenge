//
//  NetworkManager.swift
//  StackOverflowChallenge
//
//  Created by Matt Rayls on 3/9/22.
//

import Foundation

struct NetworkManager {
    
    static func makeMockedRequest() -> SORequest? {
        if let path = Bundle.main.path(forResource: "test", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                
                if let parsedRequest = Parser.parseRequest(witData: data) {
                    return parsedRequest
                }
            } catch let error {
                print(String(describing: error))
            }
        }
        
        return nil
    }
    
    static func makeGetRequest(completionHander: @escaping (SORequest?) -> Void) {
        
        guard let url = URLBuilder.getURLString() else {
            return print("Couldn't get URL")
        }
        
        var urlRequest = URLRequest(url: url )
        urlRequest.httpMethod = "GET"
        
        print("*** Starting API call with url: \(url)")
        
        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest, completionHandler: { data, _, error -> Void in
            
            guard error == nil else { return print("Error:\n\(error.debugDescription)")}
            
            if let parsedRequest = Parser.parseRequest(witData: data) {
                completionHander(parsedRequest)
            }
        })
        
        task.resume()
    }
}
