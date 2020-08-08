//  Copyright © 2020 ACartagena. All rights reserved.

import SwiftUI

struct VillagerView: View {

    let villager: Villager

    var body: some View {
        HStack {
            if villager.imageURL != nil {
                AsyncImage(url: villager.imageURL!)
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
            }
            VStack(alignment: .leading, spacing: 16) {
                Text("\(villager.name) \(villager.gender.display)")
                    .font(.title)
                HStack(spacing: 8) {
                    Text(villager.personality.rawValue)
                        .tag(backgroundColor: Color(.systemPurple))
                    Text(villager.species.rawValue)
                        .tag(backgroundColor: Color(.systemTeal))
                }
            }
            .padding(.leading, 10)
        }
    }
}

struct VillagerView_Previews: PreviewProvider {
    static var previews: some View {
        VillagerView(villager: Villager.marshall)
    }
}
