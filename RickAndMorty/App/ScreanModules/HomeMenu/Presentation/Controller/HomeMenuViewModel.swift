//
//  HomeMenuViewModel.swift
//  RickAndMorty
//
//  Created by 김명현 on 6/19/24.
//

import Combine
import Foundation

protocol HomeMenuViewModel {
    var state: PassthroughSubject<StateController, Never> { get }
    var menuItemCount: Int { get }
    
    func viewDidLoad()
    func getItemMenuViewModel(indexPath: IndexPath) -> ItemHomeMenuViewModel
    func getMenuItem(indexPath: IndexPath) -> MenuItem
}

final class HomeMenuViewModelImp: HomeMenuViewModel {
    var state: PassthroughSubject<StateController, Never>
    
    var menuItemCount: Int {
        menuItems.count
    }
    
    private let loadMenuUseCase: LoadMenuUseCase
    private var menuItems: [MenuItem] = []
    
    init(state: PassthroughSubject<StateController, Never>, loadMenuUseCase: LoadMenuUseCase) {
        self.state = state
        self.loadMenuUseCase = loadMenuUseCase
    }
    
    func viewDidLoad() {
        state.send(.loading)
        Task {
            let result = await  loadMenuUseCase.execute()
            updateUI(result: result)
            
        }
    }
    
    private func updateUI(result: Result<[MenuItem], Error>) {
        switch result {
        case .success(let menuItems):
            self.menuItems = menuItems
            state.send(.success)
        case .failure(let error):
            state.send(.fail(error: error.localizedDescription))
        }
        
    }
    
    func getItemMenuViewModel(indexPath: IndexPath) -> ItemHomeMenuViewModel {
        let menuItem =  menuItems[indexPath.row]
        return ItemHomeMenuViewModel(menuItem: menuItem)
    }
    
    func getMenuItem(indexPath: IndexPath) -> MenuItem {
        menuItems[indexPath.row]
    }
}
