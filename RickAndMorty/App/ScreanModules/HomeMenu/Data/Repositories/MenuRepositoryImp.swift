//
//  MenuRepositoryImp.swift
//  RickAndMorty
//
//  Created by 김명현 on 6/19/24.
//

import Foundation

struct MenuRepositoryImp: MenuRepository {
    let apiClientService: ApiClientService
    let urlList: String
    
    func fetchMenuData() async throws -> [MenuItem] {
        let url = URL(string: urlList)
        return try await apiClientService.request(url: url, type: MenuDTO.self).toDomain()
    }
}
