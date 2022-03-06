//
//  ItemView.swift
//  StackOverflowChallenge
//
//  Created by Matt Rayls on 3/5/22.
//

import SwiftUI

struct ItemView: View {
    let item: Item
    
    var body: some View {
        VStack {
            Text(item.title)
        }
    }
}
