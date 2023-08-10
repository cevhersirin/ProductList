//
//  ProductListViewController.swift
//  ProductList
//
//  Created by Cevher Şirin on 10.08.2023.
//

import UIKit

class ProductListViewController: BaseViewController<ProductListViewModel> {

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getProductList()
    }
}
