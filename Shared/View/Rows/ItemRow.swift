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
            
            HStack {
                Text("Asked by: ")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                Text(item.owner.displayName)
                    .font(.footnote)
                    .padding([.leading, .trailing, .top, .bottom], 2)
                    .foregroundColor(.white)
                    .background(.black).opacity(0.8)
                    .cornerRadius(5)
            }
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
