//
//  VillagerView.swift
//  AnimalCrossingSwiftUI
//
//  Created by Anthony Egerton on 29/7/20.
//

import SwiftUI

struct VillagerView: View {
    let villager: Villager

    var body: some View {
        HStack {
            Color.gray
                .frame(width: 60, height: 60)
                .clipShape(Circle())
            VStack(alignment: .leading, spacing: 10) {
                Text(villager.name)
                    .font(.title)
                HStack(spacing: 5) {
                    Text(villager.personality.rawValue)
                        .tag(backgroundColor: Color(.systemOrange))
                    Text(villager.gender.rawValue)
                        .tag(backgroundColor: Color(.systemPurple))
                    Text(villager.species.rawValue)
                        .tag(backgroundColor: Color(.systemTeal))
                }
            }
        }
    }
}

struct VillagerView_Previews: PreviewProvider {
    static func sampleVillager() -> Villager {
        Villager(
            id: 61,
            name: "Ankha",
            personality: AnimalCrossingSwiftUI.Villager.Personality.snooty,
            birthday: "22/9",
            species: AnimalCrossingSwiftUI.Villager.Species.alligator,
            gender: AnimalCrossingSwiftUI.Villager.Gender.female,
            catchPhrase: "memeow",
            imageURL: URL(string: "https://acnhapi.com/v1/images/villagers/61")
        )
    }

    static var previews: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(1..<10) { _ in
                VillagerView(villager: sampleVillager())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(Color(.systemYellow))
                    .cornerRadius(12.0)
                    .padding(.horizontal)
            }
        }
    }
}

