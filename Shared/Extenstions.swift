//
//  Extenstions.swift
//  StackOverflowChallenge
//
//  Created by Matt Rayls on 3/5/22.
//

import Foundation

extension Data {
    func getJSONDict() -> [String: Any]? {
        
        do {
            let json = try JSONSerialization.jsonObject(with: self, options: .allowFragments)
            if JSONSerialization.isValidJSONObject(json) {
                return json as? [String: Any]
            }
            
            return nil
        } catch let error {
            print(error.localizedDescription)
            
            return nil
        }
    }
}

extension Date {
    func previousMonthDate() -> Date? {
        return Calendar.current.date(byAdding: .month, value: -1, to: self)
    }
    
    func previousWeekDate() -> Date? {
        return Calendar.current.date(byAdding: .day, value: -7, to: self)
    }
    
    func previousDayDate() -> Date? {
        return Calendar.current.date(byAdding: .day, value: -1, to: self)
    }
    
    func toEpochString() -> String {
        return Int(self.timeIntervalSince1970).toString()
    }
}

extension Int {
    func toString() -> String {
        return String(describing: self)
    }
}
