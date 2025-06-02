//
//  RealmManager.swift
//  Task_2_3_Realm
//
//  Created by Егор Голубев on 30.05.2025.
//

import Foundation
import RealmSwift
import Security


final class RealmManager {
    
    private var realm = try! Realm()
    
    func addCitation(jsonStrct: RandomCitationJson) {
        
        do {
            
            let doubleCitation = checkDouble(CitationRealm.self, key: "citation", value: jsonStrct.value)
            if !doubleCitation {
                
                var category = "Без категории"
                
                if !jsonStrct.categories.isEmpty {
                    category = jsonStrct.categories.first ?? "Без категории"
                }
                
                let doubleCategory = checkDouble(CategoryRealm.self, key: "category", value: category)
                
                if !doubleCategory {
                    try realm.write {
                        let newElement = CategoryRealm()
                        newElement.category = category
                        newElement.date = Date()
                        realm.add(newElement)
                    }
                }
                
                try realm.write {
                    let newElement = CitationRealm()
                    newElement.citation = jsonStrct.value
                    newElement.date = Date()
                    newElement.category = category
                    realm.add(newElement)
                }
            }
            
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    private func checkDouble<Model: Object>(_ model: Model.Type, key: String, value: String) -> Bool {
        let foundElement = realm.objects(model.self).filter("%K == %@", key, value).first
        return foundElement != nil
    }
    
    func loadCitations() -> [CitationRealm] {
        
        let allCitations = realm.objects(CitationRealm.self)
        let arrayCitation = Array(allCitations)
        return arrayCitation.sorted{$0.date > $1.date}
        
    }
    
    func loadCategory() -> [CategoryRealm] {
        
        let allCategory = realm.objects(CategoryRealm.self)
        return Array(allCategory)
        
    }

    func loadSelectedCitations(category: String) -> [CitationRealm] {
        
        let selectedCitations = realm.objects(CitationRealm.self).filter("category == %@", category)
        return Array(selectedCitations)
        
    }
    
}
