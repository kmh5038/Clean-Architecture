//
//  MenuDTO.swift
//  RickAndMorty
//
//  Created by 김명현 on 6/20/24.
//

struct MenuDTO: Decodable {
    let characters: String
    let locations: String
    let episodes: String
}

extension MenuDTO: PropertyIterator {}
