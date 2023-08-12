//
//  BaseViewController.swift
//  ProductList
//
//  Created by Cevher Şirin on 10.08.2023.
//

class BaseViewController<V: BaseViewModelProtocol>: UIViewController {
    
    var viewModel: V
    
    init(viewModel: V) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        debugPrint("showingController: \(self)")
        
        configureContents()
        subscribeLoading()
        subscribeActivityIndicator()
    }
    
    private func configureContents() {
        view.backgroundColor = UIColorConstants.shared.backgroundColor
        navigationItem.backBarButtonItem = BackBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    @objc
    func tryAgainButtonTapped() {
        viewModel.tryAgainButtonTapped()
    }
    
    deinit {
        debugPrint("deinit \(self)")
    }
    
    private class BackBarButtonItem: UIBarButtonItem {
        @available(iOS 14.0, *)
        override var menu: UIMenu? {
            get {
                return super.menu
            }
            set {
                /* Don't set the menu here */
                /* super.menu = menu */
            }
        }
    }
    
}

// MARK: - Loading
extension BaseViewController: LoadingProtocol {
    private func subscribeLoading() {
        viewModel.showLoading = { [weak self] in
            DispatchQueue.main.async {
                self?.presentLoading()
            }
        }
        viewModel.hideLoading = { [weak self] in
            DispatchQueue.main.async {
                self?.dismissLoading()
            }
        }
    }
}

// MARK: - ActivityIndicatorView
extension BaseViewController: ActivityIndicatorProtocol {
    private func subscribeActivityIndicator() {
        viewModel.showActivityIndicatorView = { [weak self] in
            self?.showActivityIndicator()
        }
        viewModel.hideActivityIndicatorView = { [weak self] in
            self?.hideActivityIndicator()
        }
    }
}

