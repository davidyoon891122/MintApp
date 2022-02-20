//
//  HomeViewController.swift
//  MintApp
//
//  Created by David Yoon on 2022/02/20.
//

import UIKit
import Alamofire

class HomeViewController: UIViewController {
    private var networkManager = NetworkManager()
    
    private lazy var indicatorView: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigation()
        addSubviews()
        setLayoutConstraints()
        indicatorView.startAnimating()
        networkManager.requestMyStock { [weak self] mystocks in
            self?.indicatorView.stopAnimating()
            print(mystocks)
        }
    }
    
    
}


private extension HomeViewController {
    func configureNavigation() {
        navigationItem.title = "Home"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: self, action: #selector(tapRightBarButton))
    }
    
    func addSubviews() {
        [indicatorView]
            .forEach {
                view.addSubview($0)
            }
    }
    
    func setLayoutConstraints() {
        indicatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        indicatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    @objc func tapRightBarButton() {
        print("rightBarButton tapped")
    }
                                                                
}
