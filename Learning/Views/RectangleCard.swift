//
//  RectangleCard.swift
//  Learning
//
//  Created by Khayrul on 2/21/22.
//

import SwiftUI

struct RectangleCard: View {
    
    var color = Color.green
    
    var body: some View {
        Rectangle()
            .fill(color)
            .cornerRadius(10)
            .shadow(radius: 5)
    }
}

struct RectangleCard_Previews: PreviewProvider {
    static var previews: some View {
        RectangleCard()
    }
}
