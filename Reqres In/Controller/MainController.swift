//
//  ViewController.swift
//  Reqres In
//
//  Created by Suprianto Djamalu on 12/07/19.
//  Copyright © 2019 Suprianto Djamalu. All rights reserved.
//

import UIKit

class MainController: BaseController {

    private let tabBarVC = UITabBarController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        setTabBar()
    }
    
    func setTabBar(){
        
        let peopleVC = PeopleController()
        let aboutVC = AboutController()
        
        peopleVC.tabBarItem = UITabBarItem.init(title: "People", image: UIImage(named: "img_people"), tag: 0)
        aboutVC.tabBarItem = UITabBarItem.init(title: "About", image: UIImage(named: "img_about"), tag: 1)
        
        let controllers = [peopleVC, aboutVC]
        
        tabBarVC.view.tintColor = .orange
        tabBarVC.viewControllers = controllers.map({
            UINavigationController(rootViewController: $0)
        })
        
    }
    
    override func setupUI(){
        
        // view
        view.backgroundColor = .white
        view.addSubview(tabBarVC.view)
        
    }

}

