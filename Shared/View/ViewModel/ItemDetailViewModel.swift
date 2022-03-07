//
//  ItemDetailViewModel.swift
//  StackOverflowChallenge
//
//  Created by Matt Rayls on 3/7/22.
//

import Foundation

class ItemDetailViewModel: ObservableObject {
    
    func formatMarkdown(markdown: String) -> AttributedString? {
        let attributedString: AttributedString
        
        do {
            attributedString = try AttributedString(markdown: markdown)
        } catch {
            print("Error creating AttributedString:  \(error)")
            return nil
        }
        
        return attributedString
    }
}
