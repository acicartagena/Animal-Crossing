// Copyright © 2020 ACartagena. All rights reserved.

import Foundation

struct Villager: Hashable {
    let id: Int
    let name: String
    let personality: String
    let brithday: Date
    let species: String
    let gender: String
    let catchPhrase: String
    let imageURL: URL
}

extension Villager {
    static let empty = Villager(id: 0, name: "", personality: "", brithday: Date(), species: "", gender: "", catchPhrase: "", imageURL: URL(string: "")!)

    static let stu = Villager(id: 0, name: "Stu", personality: "Lazy", brithday: Date(), species: "Bull", gender: "Bull", catchPhrase: "mrooooo", imageURL: URL(string: "https://acnhapi.com/v1/images/villagers/38")!)
}

