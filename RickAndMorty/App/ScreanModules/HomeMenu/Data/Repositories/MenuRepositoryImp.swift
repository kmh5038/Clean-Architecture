//
//  MenuRepositoryImp.swift
//  RickAndMorty
//
//  Created by 김명현 on 6/19/24.
//

struct MenuRepositoryImp: MenuRepository {
    func fetchMenuData() async throws -> [MenuItem] {
        [MenuItem(title: "categories", url: "nada")]
    }
}
