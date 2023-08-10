//
//  ActivityIndicatorView.swift
//  ProductList
//
//  Created by Cevher Şirin on 10.08.2023.
//

public class ActivityIndicatorView: UIActivityIndicatorView {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        style = .gray
        tintColor = .black
        hidesWhenStopped = true
    }
    
}
