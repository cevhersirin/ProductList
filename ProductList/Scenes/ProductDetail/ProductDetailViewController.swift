//
//  ProductDetailViewController.swift
//  ProductList
//
//  Created by Cevher Şirin on 11.08.2023.
//

import UIKit

class ProductDetailViewController: BaseViewController<ProductDetailViewModel> {

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getProductDetail()
    }

}
