//
//  ApiClientService.swift
//  RickAndMorty
//
//  Created by 김명현 on 6/20/24.
//

import Foundation

protocol ApiClientService {
    func request<T: Decodable>(url: URL?, type: T.Type) async throws -> T
}
