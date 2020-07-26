//  Copyright © 2020 ACartagena. All rights reserved.

import Foundation

public typealias VillagersResponse = [String: VillagerResponse]

public struct VillagerResponse: Decodable {
    public enum Personality: String, Decodable {
        case lazy = "Lazy"
        case jock = "Jock"
        case cranky = "Cranky"
        case smug = "Smug"
        case normal = "Normal"
        case peppy = "Peppy"
        case snooty = "Snooty"
        case sisterly = "Sisterly"
        case uchi = "Uchi"
    }

    public enum Gender: String, Decodable {
        case male = "Male"
        case female = "Female"
    }

    public enum Species: String, Decodable {
        case alligator = "Alligator"
        case anteater = "Anteater"
        case bear = "Bear"
        case bird = "Bird"
        case bull = "Bull"
        case cat = "Cat"
        case chicken = "Chicken"
        case cow = "Cow"
        case cub = "Cub"
        case deer = "Deer"
        case dog = "Dog"
        case duck = "Duck"
        case eagle = "Eagle"
        case elephant = "Elephant"
        case frog = "Frog"
        case goat = "Goat"
        case gorilla = "Gorilla"
        case hamster = "Hamster"
        case hippo = "Hippo"
        case horse = "Horse"
        case kangaroo = "Kangaroo"
        case koala = "Koala"
        case lion = "Lion"
        case monkey = "Monkey"
        case mouse = "Mouse"
        case octopus = "Octopus"
        case ostrich = "Ostrich"
        case penguin = "Penguin"
        case pig = "Pig"
        case rabbit = "Rabbit"
        case rhino = "Rhino"
        case sheep = "Sheep"
        case squirrel = "Squirrel"
        case tiger = "Tiger"
        case wolf = "Wolf"
    }

    public struct Name: Decodable {
        public let us: String

        enum CodingKeys: String, CodingKey {
            case us = "name-USen"
        }
    }

    public let id: Int
    public let name: Name
    public let personality: Personality
    public let gender: Gender
    public let species: Species
    public let catchPhrase: String
    public let imageURI: String
    public let iconURI: String
    public let birthday: String //todo: make date later

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case personality
        case gender
        case species
        case catchPhrase = "catch-phrase"
        case imageURI = "image_uri"
        case iconURI = "icon_uri"
        case birthday
    }
}
