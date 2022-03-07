//
//  ItemView.swift
//  StackOverflowChallenge
//
//  Created by Matt Rayls on 3/5/22.
//

import SwiftUI

struct ItemRow: View {
    let item: Item
    
    var body: some View {
        VStack {
            Text(item.title)
                .padding([.top], 5)
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("Asked by: \(item.owner.displayName)")
                .padding([.bottom], 5)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.leading, 5)
        .frame(
              minWidth: 0,
              maxWidth: .infinity,
              minHeight: 0,
              maxHeight: .infinity,
              alignment: .leading
            )
    }
}

