//
//  UIView+Contraints.swift
//  RickAndMorty
//
//  Created by 김명현 on 6/19/24.
//

import UIKit

extension UIView {
    func setConstraints(top: NSLayoutYAxisAnchor? = nil,
                        right: NSLayoutXAxisAnchor? = nil,
                        bottom: NSLayoutYAxisAnchor? = nil,
                        left: NSLayoutXAxisAnchor? = nil,
                        pTop: CGFloat = CGFloat.zero,
                        pRight: CGFloat = CGFloat.zero,
                        pBottom: CGFloat = CGFloat.zero,
                        pLeft: CGFloat = CGFloat.zero
    ) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: pTop).isActive = true
        }
        
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -pRight).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -pBottom).isActive = true
        }
        
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: pLeft).isActive = true
        }
    }
    
    func  fillSuperView(widthPadding: CGFloat = .zero) {
        guard let superview = self.superview else { return }
        setConstraints(top: superview.topAnchor,
                       right: superview.rightAnchor,
                       bottom: superview.bottomAnchor,
                       left: superview.leftAnchor,
                       pTop: widthPadding,
                       pRight: widthPadding,
                       pBottom: widthPadding,
                       pLeft: widthPadding)
    }
}
