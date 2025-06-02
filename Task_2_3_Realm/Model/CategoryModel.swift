//
//  CategoryModel.swift
//  Task_2_3_Realm
//
//  Created by Егор Голубев on 30.05.2025.
//

import Foundation
import RealmSwift

class CategoryRealm: Object {
    @Persisted var category: String
    @Persisted var date: Date
}
