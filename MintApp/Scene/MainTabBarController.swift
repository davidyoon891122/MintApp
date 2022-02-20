//
//  MainTabBarController.swift
//  MintApp
//
//  Created by David Yoon on 2022/02/20.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    private lazy var homeViewController: UINavigationController = {
        let homeViewController = HomeViewController()
        homeViewController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house.fill"), tag: 0)
        return UINavigationController(rootViewController: homeViewController)
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [homeViewController]
    }
}
