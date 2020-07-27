// Copyright © 2020 ACartagena. All rights reserved.

import Foundation

struct Villager: Hashable {

    enum Personality: String, Hashable {
        case lazy = "Lazy"
        case jock = "Jock"
        case cranky = "Cranky"
        case smug = "Smug"
        case normal = "Normal"
        case peppy = "Peppy"
        case snooty = "Snooty"
        case sisterly = "Sisterly"
        case uchi = "Uchi"
        case unknown
    }

    enum Gender: String, Hashable {
        case male = "Male"
        case female = "Female"
        case unknown
    }

    enum Species: String, Hashable {
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
        case unknown
    }


    let id: Int
    let name: String
    let personality: Personality
    let birthday: String
    let species: Species
    let gender: Gender
    let catchPhrase: String
    let imageURL: URL?
}

extension Villager {
    static let empty = Villager(id: 0, name: "", personality: .unknown, birthday: "", species: .unknown, gender: .unknown, catchPhrase: "", imageURL: nil)

    static let stu = Villager(id: 0, name: "Stu", personality: .lazy, birthday: "", species: .bull, gender: .male, catchPhrase: "mrooooo", imageURL: URL(string: "https://acnhapi.com/v1/images/villagers/38")!)

    static let marshall = Villager(id: 1, name: "Marshal", personality: .smug, birthday: "", species: .squirrel, gender: .male, catchPhrase: "sulky", imageURL: URL(string: "https://acnhapi.com/v1/images/villagers/372")!)
}

