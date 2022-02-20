//
//  HomeViewController.swift
//  MintApp
//
//  Created by David Yoon on 2022/02/20.
//

import UIKit

class HomeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigation()
    }
    
    
}


private extension HomeViewController {
    func configureNavigation() {
        navigationItem.title = "Home"
        //navigationController?.navigationBar.prefersLargeTitles = true
    }
}
