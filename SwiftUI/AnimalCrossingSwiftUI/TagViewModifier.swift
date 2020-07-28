//  Copyright © 2020 ACartagena. All rights reserved.

import SwiftUI

struct Tag: ViewModifier {
    let backgroundColor: Color
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 12)
            .background(backgroundColor)
            .cornerRadius(12.0)
    }
}

extension View {
    func tag(backgroundColor: Color) -> some View {
        self.modifier(Tag(backgroundColor: backgroundColor))
    }
}
