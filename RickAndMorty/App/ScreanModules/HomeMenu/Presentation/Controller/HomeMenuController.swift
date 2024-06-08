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
        viewModel.state.sink { state in
            switch state {
            case .success:
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
            }
            case .loading:
                print("loading")
            case .fail(error: let error):
                print("error",error)
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
        cell.ConfingData(viewModel: viewModelCell)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.menuItemCount
    }
}


