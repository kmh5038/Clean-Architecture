//
//  MenuRepository.swift
//  RickAndMorty
//
//  Created by 김명현 on 6/19/24.
//

protocol MenuRepository {
    func fetchMenuData() async throws -> [MenuItem] 
}
