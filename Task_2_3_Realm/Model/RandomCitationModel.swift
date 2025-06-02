//
//  RandomCitationJson.swift
//  Task_2_3_Realm
//
//  Created by Егор Голубев on 29.05.2025.
//

import Foundation
import RealmSwift

class CitationRealm: Object {
    @Persisted var citation: String
    @Persisted var date: Date
    @Persisted var category: String
}

struct RandomCitationJson: Codable {
    let icon_url: String
    let id: String
    let url: String
    let value: String
    let categories: [String]
}
