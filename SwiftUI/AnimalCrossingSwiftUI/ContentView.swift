//  Copyright © 2020 ACartagena. All rights reserved.

import SwiftUI
import Combine

struct ContentView: View {

    @State private var allVillagers: [Villager] = [] {
        didSet {
            villagers = allVillagers
        }
    }
    @State var villagers: [Villager] = []
    @State var error: AnimalCrossingError?

    private var subscribers = Set<AnyCancellable>()

    init(service: VillagersService = VillagersService()) {
        service.villagers().sink { [self] (competion) in
            switch competion {
            case .failure(let error): self.error = error
            case .finished: break
            }
        } receiveValue: { [self] villagers in
            self.allVillagers = villagers
        }.store(in: &subscribers)
    }

    var body: some View {
        Text("Loading...").padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
