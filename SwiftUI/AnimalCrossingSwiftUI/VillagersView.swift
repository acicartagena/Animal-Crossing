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
                    Spacer()
                }
                LazyVStack(spacing: 16) {
                    ForEach(viewModel.villagers, id:\.id) { villager in
                        VillagerView(villager: villager)
                    }
                }
                .padding(.top, 10)
                .background(Color(.systemGreen))
            }
            .background(Color(.systemGreen))
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
