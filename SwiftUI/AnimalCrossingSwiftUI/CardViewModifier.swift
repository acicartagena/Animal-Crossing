//  Copyright © 2020 ACartagena. All rights reserved.

import SwiftUI

struct Card: ViewModifier {
    let backgroundColor: Color
    func body(content: Content) -> some View {
        return content
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(backgroundColor)
            .cornerRadius(12.0)
            .padding(.horizontal, 10)
    }
}

extension View {
    func cardView(backgroundColor: Color = Color(.systemYellow)) -> some View {
        self.modifier(Card(backgroundColor: backgroundColor))
    }
}
