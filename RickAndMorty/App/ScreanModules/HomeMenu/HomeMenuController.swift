//
//  HomeMenuController.swift
//  RickAndMorty
//
//  Created by 김명현 on 5/21/24.
//

import UIKit

class HomeMenuController: UICollectionViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        configCollectionView()
    }
    private func configUI() {
        
    }
    
    private func configCollectionView() {
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "id")
    }
}

extension HomeMenuController {
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "id", for: indexPath)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
}
