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

extension String {
    func formatHTMLString() -> String {
        if let data = self.data(using: String.Encoding.unicode) {
            do {
                return try NSAttributedString(
                    data: data,
                    options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html],
                    documentAttributes: nil).string
            } catch let error {
                print(String(describing: error))
            }
        }
        
        return "Error: couldn't parse HTML"
    }
}
