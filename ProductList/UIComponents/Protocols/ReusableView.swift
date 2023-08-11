//
//  Reusable.swift
//  ProductList
//
//  Created by Cevher Şirin on 11.08.2023.
//

public protocol ReusableView: AnyObject {
    static var reuseIdentifier: String { get }
}

public extension ReusableView where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
