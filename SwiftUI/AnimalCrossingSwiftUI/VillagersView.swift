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
                            .cardView()
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        VillagersView()
    }
}
