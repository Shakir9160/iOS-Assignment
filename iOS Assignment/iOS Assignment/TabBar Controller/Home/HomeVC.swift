//
//  HomeVC.swift
//  iOS Assignment
//
//  Created by Shaik Shakir on 02/06/20.
//  Copyright © 2020 Shakir. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    var postLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tabBarController?.tabBar.isHidden = false
        
        if Config.isPosted {
            self.postLabel.isHidden = false
        } else {
            self.postLabel.isHidden = true
        }
        Config.index = 0
    }
    
    func setupView() {
        self.setUpNavigationBar()
        
        self.postLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 30))
        self.postLabel.font = UIFont.boldSystemFont(ofSize: 28.0)
        self.postLabel.center = CGPoint(x: self.view.center.x, y: self.view.center.y)
        self.postLabel.textAlignment = NSTextAlignment.center
        self.postLabel.text = "Post is now live.."
        self.view.addSubview(self.postLabel)
    }
        
    func setUpNavigationBar() {
        self.navigationItem.title = "Home"
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
