//  Copyright © 2020 ACartagena. All rights reserved.

import SwiftUI

struct VillagerView: View {

    let villager: Villager

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 16) {
                Text(villager.name)
                    .font(.title)
                HStack(spacing: 8) {
                    Text(villager.personality.rawValue)
                        .tag(backgroundColor: Color(.systemOrange))
                    Text(villager.gender.rawValue)
                        .tag(backgroundColor: Color(.systemPurple))
                    Text(villager.species.rawValue)
                        .tag(backgroundColor: Color(.systemTeal))
                }
            }
            .padding(.leading, 10)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color(.systemYellow))
        .cornerRadius(12.0)
        .padding(.horizontal, 10)
    }
}

struct VillagerView_Previews: PreviewProvider {
    static var previews: some View {
        VillagerView(villager: Villager.marshall)
    }
}
