//
//  HomeFactory.swift
//  RickAndMorty
//
//  Created by 김명현 on 6/5/24.
//

import Combine
import UIKit

protocol HomeFactory {
    func makeModule() -> UIViewController
}

struct HomeFactoryImp: HomeFactory {
    func makeModule() -> UIViewController {
        let apiClientService = ApiClentServiceImp()
        let urlList = EndPoint.baseUrl
        let menuRepository = MenuRepositoryImp(apiClientService: apiClientService, urlList: urlList)
        let loadMenuUseCase = LoadMenuUseCaseImp(menuRepository: menuRepository)
        let state = PassthroughSubject<StateController, Never>()
        let homeMenuViewModel = HomeMenuViewModelImp(state: state, loadMenuUseCase: loadMenuUseCase)
        let homeMenuContorller = HomeMenuController(viewModel: homeMenuViewModel, layer: makeLayout())
        homeMenuContorller.title = "Rick And Morty"
        return homeMenuContorller
    }
    
    private func makeLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        let layoutWidth = (UIScreen.main.bounds.width - 20) / 2
        let layoutHeight = (UIScreen.main.bounds.width  - 20) / 2
        layout.itemSize = CGSize(width: layoutWidth, height: layoutHeight)
        layout.minimumLineSpacing = .zero
        layout.minimumInteritemSpacing = .zero
        layout.sectionInset = UIEdgeInsets(top: .zero, left: 10, bottom: .zero, right: 10)
        return layout
    }
}

