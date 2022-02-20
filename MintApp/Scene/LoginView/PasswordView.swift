//
//  PasswordView.swift
//  MintApp
//
//  Created by David Yoon on 2022/01/17.
//

import UIKit

protocol LoginViewProtocol: NSObject {
    func checkLoginLogin()
}


class PasswordView: UIView {
     weak var delegate: LoginViewProtocol?
    private let blackView = UIView()
    
    private lazy var topDragBar:UIView = {
        let view = UIView()
        view.backgroundColor = .separator
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .red
        stackView.axis = .vertical
        [enterButton]
            .forEach {
                stackView.addArrangedSubview($0)
            }
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var enterButton: UIButton = {
        let button = UIButton()
        button.setTitle("Enter", for: .normal)
        button.addTarget(self, action: #selector(tapEnterButton), for: .touchUpInside)
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
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
        labelStackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        labelStackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        labelStackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        labelStackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    @objc func tapEnterButton() {
        delegate?.checkLoginLogin()
    }
}


