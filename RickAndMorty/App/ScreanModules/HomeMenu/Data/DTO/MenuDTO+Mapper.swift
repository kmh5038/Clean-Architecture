//
//  MenuDTO+Mapper.swift
//  RickAndMorty
//
//  Created by 김명현 on 6/20/24.
//

extension MenuDTO {
    func toDomain() -> [MenuItem] {
        return self.dictionaryProperties().map { dictionary in
            let title = dictionary.key
            let url: String = (dictionary.value as? String) ?? String()
            return MenuItem(title: title, url: url)
        }
    }
}
