//
//  Reusable.swift
//  RickAndMorty
//
//  Created by 김명현 on 6/19/24.
//

protocol Reusable {}

extension Reusable {
    static var reuseIdentifier: String { String(describing: self) }
}
