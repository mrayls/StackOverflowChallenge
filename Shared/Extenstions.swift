//
//  Extenstions.swift
//  StackOverflowChallenge
//
//  Created by Matt Rayls on 3/5/22.
//

import Foundation

extension Date {
    func previousMonthDate() -> Date? {
        return Calendar.current.date(byAdding: .month, value: -1, to: self)
    }
    
    func previousWeekDate() -> Date? {
        return Calendar.current.date(byAdding: .day, value: -7, to: self)
    }
    
    func toEpoch() -> String {
        return Int(self.timeIntervalSince1970).toString()
    }
}

extension Int {
    func toString() -> String {
        return String(describing: self)
    }
}
