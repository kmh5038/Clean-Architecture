//
//  HomeMenuController.swift
//  RickAndMorty
//
//  Created by 김명현 on 5/21/24.
//

import Combine
import UIKit

class HomeMenuController: UICollectionViewController {
    private let viewModel: HomeMenuViewModel
    private var cancellable = Set<AnyCancellable>()
    
    init(viewModel: HomeMenuViewModel, layer: UICollectionViewLayout) {
        self.viewModel = viewModel
        super.init(collectionViewLayout: layer)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        configCollectionView()
        stateController()
        viewModel.viewDidLoad()
    }
    
    private func stateController() {
        viewModel
            .state
            .receive(on: RunLoop.main)
            .sink { [weak self] state in
                self?.hideSpinner()
                
                switch state {
                case .success:
                    self?.collectionView.reloadData()
                case .loading:
                    self?.showSpinner()
                case .fail(error: let error):
                    self?.presentAlert(message: error, title: "Error")
                }
            }.store(in: &cancellable)
    }
    
    private func configUI() {
        view.backgroundColor = .systemBackground
    }
    
    private func configCollectionView() {
        collectionView.register(ItemHomeMenuCell.self, forCellWithReuseIdentifier: ItemHomeMenuCell.reuseIdentifier)
    }
}

extension HomeMenuController {
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ItemHomeMenuCell.reuseIdentifier,
                for: indexPath
            ) as? ItemHomeMenuCell
        else { return UICollectionViewCell() }
        
        let viewModelCell = viewModel.getItemMenuViewModel(indexPath: indexPath)
        cell.confingData(viewModel: viewModelCell)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.menuItemCount
    }
}

extension HomeMenuController: SpinnerDisplayable { }

extension HomeMenuController: MessageDisplayable { }
