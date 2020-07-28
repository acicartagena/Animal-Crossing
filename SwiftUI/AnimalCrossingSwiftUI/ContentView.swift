//  Copyright © 2020 ACartagena. All rights reserved.

import SwiftUI
import Combine

struct VillagersView: View {

    

    @State private var allVillagers: [Villager] = [] {
        didSet {
            villagers = allVillagers
            print(allVillagers)
        }
    }
    @State var villagers: [Villager] = [] {
        didSet {
            print(villagers)
        }
    }
    @State var error: AnimalCrossingError?
    @State var finishedLoading: Bool = false {
        didSet {
            print(finishedLoading)
        }
    }
    private var cancellables = Set<AnyCancellable>()
    private let service: VillagersService

    init(service: VillagersService = VillagersService()) {
        self.service = service
    }

    var body: some View {
        VStack {
            if finishedLoading {
                Text("Finished")
            } else {
                Text("Loading")
            }
//            LazyVStack {
//                ForEach(villagers, id:\.id) { villager in
//                    VStack {
//                        Text(villager.name)
//                    }
//                }
//            }
        }

    }

    mutating func setup(with villagers: [Villager]) {
        self.allVillagers = villagers
        self.finishedLoading = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        VillagersView()
    }
}
