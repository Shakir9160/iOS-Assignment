//
//  AddVC.swift
//  iOS Assignment
//
//  Created by Shaik Shakir on 02/06/20.
//  Copyright © 2020 Shakir. All rights reserved.
//

import UIKit
import Photos

class AddVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tabBarController?.tabBar.isHidden = true
        
        let galleryVC = UINavigationController(rootViewController: GalleryVC())
        galleryVC.modalPresentationStyle = .fullScreen
        self.present(galleryVC, animated: false, completion: nil)
    }
}
