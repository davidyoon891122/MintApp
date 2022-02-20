//
//  LoginViewController.swift
//  MintApp
//
//  Created by David Yoon on 2022/01/17.
//

import UIKit

class LoginViewController: UIViewController {
    
    let blackView = UIView()
    let passwordView = PasswordView()
    private lazy var labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        
        [titleLabel, welcomeLabel]
            .forEach{
                stackView.addArrangedSubview($0)
            }
        
        return stackView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        let miniStringAttribute = [NSAttributedString.Key.font: UIFont.monospacedSystemFont(ofSize: 35, weight: .heavy), NSAttributedString.Key.foregroundColor: UIColor.label]
        let stockStringAttribute = [NSAttributedString.Key.font: UIFont.monospacedSystemFont(ofSize: 35, weight: .light), NSAttributedString.Key.foregroundColor: UIColor.label]
        
        let miniString = NSMutableAttributedString(string: "mini", attributes: miniStringAttribute)
        let stockString = NSMutableAttributedString(string: "stock", attributes: stockStringAttribute)
        miniString.append(stockString)
        label.attributedText = miniString
        label.textAlignment = .center
        label.textColor = .label
        return label
    }()
    
    private lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "환영합니다"
        label.font = .systemFont(ofSize: 25, weight: .medium)
        label.textAlignment = .center
        label.textColor = .systemGreen
        return label
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("간편비밀번호 로그인", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.separator.cgColor
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(tapLoginButton), for: .touchUpInside)
        button.setBackgroundColor(.systemGreen, for: .highlighted)
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        addSubviews()
        setLayoutConstraint()
        
    }
}

extension LoginViewController: LoginViewProtocol {
    func checkLoginLogin() {
        tapBlackView()
        let vc = MainTabBarController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false, completion: nil)
    }
}


private extension LoginViewController {
    func addSubviews(){
        [labelStackView, loginButton]
            .forEach{
                view.addSubview($0)
            }
        
        
    }
    
    func setLayoutConstraint() {
        labelStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        labelStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        labelStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        loginButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        loginButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
    }
    
    
    @objc func tapLoginButton() {
        guard let window = UIApplication.shared.windows.first(where: {$0.isKeyWindow}) else {
            return
        }
        
        blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
        blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapBlackView)))
        window.addSubview(blackView)
        window.addSubview(passwordView)
        passwordView.delegate = self
        
        
        let height:CGFloat = 400
        
        let y = window.frame.height - height
        passwordView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: height)
        blackView.frame = window.frame
        blackView.alpha = 0
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.blackView.alpha = 1
            
            self.passwordView.frame = CGRect(x: 0,
                                         y: y,
                                         width: self.passwordView.frame.width,
                                         height: self.passwordView.frame.height
            )
        }, completion: nil)
        
    }
    
    @objc func tapBlackView() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut) {
            
            self.blackView.alpha = 0
            
            if let window = UIApplication.shared.windows.first(where: {$0.isKeyWindow}){
                self.passwordView.frame = CGRect(
                    x: 0,
                    y: window.frame.height,
                    width: self.passwordView.frame.width,
                    height: self.passwordView.frame.height)
            }
        } completion: { _ in
            
        }
    }

}
