//
//  Coordinator.swift
//  RickAndMorty
//
//  Created by 김명현 on 5/21/24.
//

import UIKit

protocol Coordinator {
    var navigation: UINavigationController { get }
    func start()
}
