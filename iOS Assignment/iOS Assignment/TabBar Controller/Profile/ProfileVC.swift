//
//  ProfileVC.swift
//  iOS Assignment
//
//  Created by Shaik Shakir on 02/06/20.
//  Copyright © 2020 Shakir. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUpNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tabBarController?.tabBar.isHidden = false
        Config.index = 4
    }
        
    func setUpNavigationBar() {
        self.navigationItem.title = "Profile"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let searchButton = UIBarButtonItem(image: UIImage(named: "search")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(self.searchButtonTapped))
        
        let profilePicButton = UIBarButtonItem(image: UIImage(named: "user")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(self.profilePicBtnTapped))
        
        self.navigationItem.rightBarButtonItems = [profilePicButton, searchButton]
    }
    
    @objc func searchButtonTapped() {
        
    }
    
    @objc func profilePicBtnTapped() {
        
    }
}
