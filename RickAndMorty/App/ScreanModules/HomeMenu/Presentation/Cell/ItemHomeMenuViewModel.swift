//
//  ItemHomeMenuViewModel.swift
//  RickAndMorty
//
//  Created by 김명현 on 6/19/24.
//

struct ItemHomeMenuViewModel {
    private let menuItem: MenuItem
    
    init(menuItem: MenuItem) {
        self.menuItem = menuItem
    }
    
    var title: String {
        menuItem.title.capitalized
    }
    var imageName: String {
        menuItem.title
    }
}
