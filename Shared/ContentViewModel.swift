//
//  CleverName.swift
//  StackOverflowChallenge
//
//  Created by Matt Rayls on 3/3/22.
//

import Foundation

class ContentViewModel: ObservableObject {
    
    func makeRequest() {
        guard let url = URLBuilder.getURLString() else {
            return print("Couldn't get URL")
        }
        
        var request = URLRequest(url: url )
        request.httpMethod = "GET"
        
        print("*** Starting API call with url: \(url)")

        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            
            guard error == nil else { return print("Error:\n\(error.debugDescription)")}
            
            do {
                if let data = data {
                    let json = try JSONSerialization.jsonObject(with: data) as! Dictionary<String, AnyObject>
                    print(json)
                }
                
            } catch let error {
                print("Task Error: \(error)")
            }
            
        })

        task.resume()
    }
    
//    func parseSOQuestions(witData data: Data) -> [SOQuestion]? {
//        if let json = data.getJSONDict(),
//            let items = json["items"] as? [[String: Any]] {
//
//            var questions: [SOQuestion] = []
//            for item in items {
//                if let owner = item["owner"] as? [String: Any] {
//                    if let id = item["question_id"] as? Int,
//                        let title = item["title"] as? String,
//                        let body = item["body"] as? String,
//                        let author = owner["display_name"] as? String,
//                        let lastEditDateTimeStamp = item["last_activity_date"] as? Double,
//                        let answerCount = item["answer_count"] as? Int,
//                        let score = item["score"] as? Int,
//                        let isAnswered = item["is_answered"] as? Bool {
//                        let question = SOQuestion.init(id: id, title: title, body: body,
//                                                       author: author, lastEditDateTimeStamp: lastEditDateTimeStamp,
//                                                       score: score, isAnswered: isAnswered, answerCount: answerCount)
//
//                        questions.append(question)
//                    }
//                }
//            }
//
//            return questions
//        }
//
//        return nil
//    }
}
