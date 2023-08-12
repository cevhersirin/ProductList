//
//  BaseViewModel.swift
//  ProductList
//
//  Created by Cevher Şirin on 10.08.2023.
//

import Foundation

protocol BaseViewModelDataSource: AnyObject {}

protocol BaseViewModelEventSource: AnyObject {
    
    // MARK: - TryAgainButton
    var showTryAgainButton: VoidClosure? { get set }
    var hideTryAgainButton: VoidClosure? { get set }
    
    // MARK: - Loading
    var showLoading: VoidClosure? { get set }
    var hideLoading: VoidClosure? { get set }
    
    // MARK: - ActivityIndicatorView
    var showActivityIndicatorView: VoidClosure? { get set }
    var hideActivityIndicatorView: VoidClosure? { get set }
    
    // MARK: Toast
    var showWarningToast: StringClosure? { get set }
    var showSuccessToast: StringClosure? { get set }
    
    // MARK: - CapturedLoading
    var showCapturedLoadingView: VoidClosure? { get set }
    var hideCapturedLoadingView: VoidClosure? { get set }
}

protocol BaseViewModelProtocol: BaseViewModelDataSource, BaseViewModelEventSource {
    
    func tryAgainButtonTapped()
    func goBack()
}

class BaseViewModel: BaseViewModelProtocol {
    
    // MARK: - TryAgainButton
    var showTryAgainButton: VoidClosure?
    var hideTryAgainButton: VoidClosure?
    
    // MARK: - Loading
    var showLoading: VoidClosure?
    var hideLoading: VoidClosure?
    
    // MARK: - ActivityIndicatorView
    var showActivityIndicatorView: VoidClosure?
    var hideActivityIndicatorView: VoidClosure?
    
    // MARK: Toast
    var showWarningToast: StringClosure?
    var showSuccessToast: StringClosure?
    
    // MARK: - CapturedLoading
    var showCapturedLoadingView: VoidClosure?
    var hideCapturedLoadingView: VoidClosure?
    
    init() {}
        
    func tryAgainButtonTapped() {}
    
    func goBack() {}
    
    deinit {
        debugPrint("deinit \(self)")
    }
}

