//
//  UIImage+Extensions.swift
//  ProductList
//
//  Created by Cevher Şirin on 12.08.2023.
//

import Kingfisher

extension UIImage {
    func resize(to size: CGSize, for contentMode: UIView.ContentMode? = nil) -> UIImage {
        switch contentMode {
        case .scaleAspectFit:
            return kf.resize(to: size, for: .aspectFit)
        case .scaleToFill:
            return kf.resize(to: size, for: .aspectFill)
        default:
            return kf.resize(to: size)
        }
    }
}
