//
//  UseCase.swift
//  RickAndMorty
//
//  Created by 김명현 on 6/19/24.
//

protocol LoadMenuUseCase {
    func execute() async -> Result<[MenuItem], Error>
}

struct LoadMenuUseCaseImp: LoadMenuUseCase {
    let menuRepository: MenuRepository
    
    func execute() async -> Result<[MenuItem], Error> {
        do {
            let repositoryResult = try await menuRepository.fetchMenuData()
            return .success(repositoryResult)
        } catch {
            return .failure(error)
        }
    }
}
