//
//  LoadingProtocol.swift
//  ProductList
//
//  Created by Cevher Şirin on 10.08.2023.
//

public protocol LoadingProtocol {
    func presentLoading()
    func dismissLoading()
}

public extension LoadingProtocol where Self: UIViewController {
    
    func presentLoading() {
        self.view.endEditing(true)
        let window = UIApplication.shared.windows.first
        window?.startBlockingActivityIndicator()
    }
    
    func dismissLoading() {
        let window = UIApplication.shared.windows.first
        window?.stopBlockingActivityIndicator()
    }
    
}
