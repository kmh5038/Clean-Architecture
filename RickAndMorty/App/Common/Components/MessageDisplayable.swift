//
//  MessageDisplayable.swift
//  RickAndMorty
//
//  Created by 김명현 on 6/21/24.
//

import UIKit

protocol MessageDisplayable { }

extension MessageDisplayable where Self: UIViewController {
    func presentAlert(message: String, title: String) {
        let alertyController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default)
        alertyController.addAction(okAction)
        self.present(alertyController, animated: true)
    }
}
