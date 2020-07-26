// Copyright © 2020 ACartagena. All rights reserved.

import Foundation
import API

extension Villager {
    init(response: VillagerResponse) {
        id = response.id
        name = response.name.us
        personality = Personality(response: response.personality)
        birthday = response.birthday
        species = Species(response: response.species)
        gender = Gender(response: response.gender)
        catchPhrase = response.catchPhrase
        imageURL = URL(string: response.imageURI)
    }
}

extension Villager.Personality {
    init(response: VillagerResponse.Personality) {
        self = Villager.Personality(rawValue: response.rawValue) ?? .unknown
    }
}

extension Villager.Species {
    init(response: VillagerResponse.Species) {
        self = Villager.Species(rawValue: response.rawValue) ?? .unknown
    }
}

extension Villager.Gender {
    init(response: VillagerResponse.Gender) {
        self = Villager.Gender(rawValue: response.rawValue) ?? .unknown
    }
}
