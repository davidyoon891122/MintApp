//
//  PasswordView.swift
//  MintApp
//
//  Created by David Yoon on 2022/01/17.
//

import UIKit

class PasswordView: UIView {
    
    private let blackView = UIView()
    
    private lazy var topDragBar:UIView = {
        let view = UIView()
        view.backgroundColor = .separator
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setLayoutConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension PasswordView {
    func addSubviews() {
        addSubview(labelStackView)
    }
    
    
    func setLayoutConstraint() {
        labelStackView.topAnchor.constraint(equalTo: topAnchor, constant: 50).isActive = true
        labelStackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        labelStackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        labelStackView.heightAnchor.constraint(equalToConstant: 300).isActive = true
    }
}


