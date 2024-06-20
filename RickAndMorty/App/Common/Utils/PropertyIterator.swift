//
//  PropertyIterator.swift
//  RickAndMorty
//
//  Created by 김명현 on 6/20/24.
//

protocol PropertyIterator { }

extension PropertyIterator {
    func dictionaryProperties() -> [String: Any] {
        let mirror = Mirror(reflecting: self)
        var dictionary: [String: Any] = [:]
        
        mirror.children.forEach { property in
            dictionary[property.label ?? String()] = property.value
        }
        
        return dictionary
    }
}
