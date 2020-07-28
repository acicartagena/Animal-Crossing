//  Copyright © 2020 ACartagena. All rights reserved.

import SwiftUI
import Combine

struct VillagersView: View {

    @ObservedObject var viewModel: VillagersViewModel

    init(viewModel: VillagersViewModel = VillagersViewModel()) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                if viewModel.villagers.isEmpty {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .padding()
                }
                LazyVStack {
                    ForEach(viewModel.villagers, id:\.id) { villager in
                        HStack {
                            VStack(alignment: .leading, spacing: 16) {
                                Text(villager.name)
                                HStack(spacing: 8) {
                                    Text(villager.personality.rawValue)
                                        .tag(backgroundColor: Color(.systemOrange))
                                    Text(villager.gender.rawValue)
                                        .tag(backgroundColor: Color(.systemPurple))
                                    Text(villager.species.rawValue)
                                        .tag(backgroundColor: Color(.systemTeal))
                                }
                                Spacer()
                            }
                            Spacer()
                        }
                        .background(Color(.systemYellow))
                        .padding()
                    }
                }
                .background(Color(.systemGreen))
            }
            .navigationTitle("Villagers")
        }.onAppear {
            viewModel.fetchVillagers()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        VillagersView()
    }
}
