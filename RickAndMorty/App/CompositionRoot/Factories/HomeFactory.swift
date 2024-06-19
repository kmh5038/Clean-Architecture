//
//  HomeFactory.swift
//  RickAndMorty
//
//  Created by 김명현 on 6/5/24.
//

import UIKit

protocol HomeFactory {
    func makeModule() -> UIViewController
}

struct HomeFactoryImp: HomeFactory {
    func makeModule() -> UIViewController {
        var homeMenuContorller = HomeMenuController(collectionViewLayout: makeLayout())
        homeMenuContorller.title = "Rick And Morty"
        return homeMenuContorller
    }
    
    private func makeLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        return layout
    }
}

