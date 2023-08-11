//
//  UIView+Extensions.swift
//  ProductList
//
//  Created by Cevher Şirin on 11.08.2023.
//

extension UIView {
    
    func setCornerRadius(radius: CGFloat) {
        layer.cornerRadius = radius
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner]
    }
}
