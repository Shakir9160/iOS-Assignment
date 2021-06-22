//
//  PostVC.swift
//  iOS Assignment
//
//  Created by Shaik Shakir on 02/06/20.
//  Copyright © 2020 Shakir. All rights reserved.
//

import UIKit

class PostVC: UIViewController {

    var topView = UIView()
    var userImage = UIImageView()
    var captionText = UITextField ()
    var selectedImage = UIImageView()
    var btmTopview = UILabel()
    
    var tagView = UIView()
    var tagLabel = UILabel()
    var btmTagView = UILabel()
    
    var locationView = UIView()
    var locationLabel = UILabel()
    var btmLocView = UILabel()
    
    var socialView = UIView()
    var postView = UIView()
    var postLbl = UILabel()
    var btmSocialView = UILabel()
    
    var textLabel = UILabel()
    
    var postTableView = UITableView()
    var cellId = "postCell"
    var postArr: [String] = ["Facebook", "Twitter", "Tumblr"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupView()
    }
    
    func setupView() {
        self.setUpNavigationBar()
        self.view.backgroundColor = UIColor.white
        
        self.setTopView()
        self.setTagView()
        self.setLocationView()
        self.setSocialView()
        
        self.textLabel.text = "Advanced Settings"
        self.textLabel.font = UIFont.systemFont(ofSize: 11.0)
        self.textLabel.textColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.5)
        
        self.view.addSubview(self.textLabel)
        
        self.textLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            (self.textLabel.topAnchor.constraint(equalTo: self.socialView.bottomAnchor, constant: 10)),
            (self.textLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20))
        ])
    }
    
    func setUpNavigationBar() {
        self.navigationItem.title = "New Post"
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "left_arrow")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(self.backBtnTapped))
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Share", style: .plain, target: self, action: #selector(self.submitBtnTapped))
    }
    
    func setTopView() {
        self.view.addSubview(self.topView)
        
        self.topView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            (self.topView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: -10)),
            (self.topView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0)),
            (self.topView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0)),
            (self.topView.heightAnchor.constraint(equalToConstant: 90))
        ])
        
        self.userImage.image = UIImage(named: "user")
        self.captionText.placeholder = "Write a caption.."
        self.selectedImage = Config.selectedImage
        self.selectedImage.contentMode = .scaleToFill
        self.btmTopview.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.3)
        
        self.topView.addSubview(self.userImage)
        self.topView.addSubview(self.captionText)
        self.topView.addSubview(self.selectedImage)
        self.topView.addSubview(self.btmTopview)
        
        self.userImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            (self.userImage.topAnchor.constraint(equalTo: self.topView.topAnchor, constant: 30)),
            (self.userImage.leftAnchor.constraint(equalTo: self.topView.leftAnchor, constant: 15)),
            (self.userImage.widthAnchor.constraint(equalToConstant: 40)),
            (self.userImage.heightAnchor.constraint(equalTo: self.userImage.widthAnchor))
        ])
        
        self.captionText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            (self.captionText.centerYAnchor.constraint(equalTo: self.userImage.centerYAnchor)),
            (self.captionText.leftAnchor.constraint(equalTo: self.userImage.rightAnchor, constant: 10)),
            (self.captionText.rightAnchor.constraint(equalTo: self.topView.rightAnchor, constant: -85)),
            (self.captionText.heightAnchor.constraint(equalTo: self.userImage.heightAnchor))
        ])
        
        self.selectedImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            (self.selectedImage.topAnchor.constraint(equalTo: self.topView.topAnchor, constant: 25)),
            (self.selectedImage.rightAnchor.constraint(equalTo: self.topView.rightAnchor, constant: -10)),
            (self.selectedImage.widthAnchor.constraint(equalToConstant: 70)),
            (self.selectedImage.heightAnchor.constraint(equalToConstant: 50))
        ])
        
        self.btmTopview.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            (self.btmTopview.leftAnchor.constraint(equalTo: self.topView.leftAnchor, constant: 0)),
            (self.btmTopview.rightAnchor.constraint(equalTo: self.topView.rightAnchor, constant: 0)),
            (self.btmTopview.bottomAnchor.constraint(equalTo: self.topView.bottomAnchor, constant: 0)),
            (self.btmTopview.heightAnchor.constraint(equalToConstant: 0.3))
        ])
    }
    
    func setTagView() {
        self.view.addSubview(self.tagView)
        
        self.tagView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            (self.tagView.topAnchor.constraint(equalTo: self.topView.bottomAnchor, constant: 0)),
            (self.tagView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0)),
            (self.tagView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0)),
            (self.tagView.heightAnchor.constraint(equalToConstant: 50))
        ])
        
        self.tagLabel.text = "Tag People"
        self.btmTagView.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.3)
        
        self.tagView.addSubview(self.tagLabel)
        self.tagView.addSubview(self.btmTagView)
        
        self.tagLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            (self.tagLabel.centerYAnchor.constraint(equalTo: self.tagView.centerYAnchor)),
            (self.tagLabel.leftAnchor.constraint(equalTo: self.tagView.leftAnchor, constant: 20)),
            (self.tagLabel.rightAnchor.constraint(equalTo: self.tagView.rightAnchor, constant: 20))
        ])
        
        self.btmTagView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            (self.btmTagView.leftAnchor.constraint(equalTo: self.tagView.leftAnchor, constant: 0)),
            (self.btmTagView.rightAnchor.constraint(equalTo: self.tagView.rightAnchor, constant: 0)),
            (self.btmTagView.bottomAnchor.constraint(equalTo: self.tagView.bottomAnchor, constant: 0)),
            (self.btmTagView.heightAnchor.constraint(equalToConstant: 0.3))
        ])
    }
    
    func setLocationView() {
        self.view.addSubview(self.locationView)
        
        self.locationView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            (self.locationView.topAnchor.constraint(equalTo: self.tagView.bottomAnchor, constant: 0)),
            (self.locationView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0)),
            (self.locationView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0)),
            (self.locationView.heightAnchor.constraint(equalToConstant: 50))
        ])
        
        self.locationLabel.text = "Add Location"
        self.btmLocView.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.3)
        
        self.locationView.addSubview(self.locationLabel)
        self.locationView.addSubview(self.btmLocView)
        
        self.locationLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            (self.locationLabel.centerYAnchor.constraint(equalTo: self.locationView.centerYAnchor)),
            (self.locationLabel.leftAnchor.constraint(equalTo: self.locationView.leftAnchor, constant: 20)),
            (self.locationLabel.rightAnchor.constraint(equalTo: self.locationView.rightAnchor, constant: 20))
        ])
        
        self.btmLocView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            (self.btmLocView.leftAnchor.constraint(equalTo: self.locationView.leftAnchor, constant: 0)),
            (self.btmLocView.rightAnchor.constraint(equalTo: self.locationView.rightAnchor, constant: 0)),
            (self.btmLocView.bottomAnchor.constraint(equalTo: self.locationView.bottomAnchor, constant: 0)),
            (self.btmLocView.heightAnchor.constraint(equalToConstant: 0.3))
        ])
    }
    
    func setSocialView() {
        self.view.addSubview(self.socialView)
        
        self.socialView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            (self.socialView.topAnchor.constraint(equalTo: self.locationView.bottomAnchor, constant: 0)),
            (self.socialView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0)),
            (self.socialView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0)),
            (self.socialView.heightAnchor.constraint(equalToConstant: 210))
        ])
        
        self.socialView.addSubview(self.postView)
        
        self.postView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            (self.postView.topAnchor.constraint(equalTo: self.socialView.topAnchor, constant: 0)),
            (self.postView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0)),
            (self.postView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0)),
            (self.postView.heightAnchor.constraint(equalToConstant: 45))
        ])
        
        self.postLbl.text = "Also post to"
        
        self.postView.addSubview(self.postLbl)
        
        self.postLbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            (self.postLbl.topAnchor.constraint(equalTo: self.postView.topAnchor, constant: 20)),
            (self.postLbl.leftAnchor.constraint(equalTo: self.postView.leftAnchor, constant: 20)),
            (self.postLbl.rightAnchor.constraint(equalTo: self.postView.rightAnchor, constant: 20))
        ])
        
        self.postTableView = UITableView(frame: CGRect(x: self.socialView.frame.origin.x, y: self.postView.frame.size.height, width: self.socialView.frame.size.width, height: (self.socialView.frame.size.height - self.postView.frame.size.height - 15)))
        self.postTableView.dataSource = self
        self.postTableView.delegate = self
        self.postTableView.register(PostCell.self, forCellReuseIdentifier: cellId)
        self.postTableView.showsVerticalScrollIndicator = false
        self.postTableView.backgroundColor = UIColor.white
        self.postTableView.bouncesZoom = false
        self.postTableView.separatorStyle = .none
        self.socialView.addSubview(self.postTableView)
        
        self.postTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            (self.postTableView.topAnchor.constraint(equalTo: self.postView.bottomAnchor, constant: 0)),
            (self.postTableView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0)),
            (self.postTableView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0)),
            (self.postTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0))
        ])
        
        self.btmSocialView.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.3)
        
        self.socialView.addSubview(self.btmSocialView)
        
        self.btmSocialView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            (self.btmSocialView.leftAnchor.constraint(equalTo: self.socialView.leftAnchor, constant: 0)),
            (self.btmSocialView.rightAnchor.constraint(equalTo: self.socialView.rightAnchor, constant: 0)),
            (self.btmSocialView.bottomAnchor.constraint(equalTo: self.socialView.bottomAnchor, constant: 0)),
            (self.btmSocialView.heightAnchor.constraint(equalToConstant: 0.3))
        ])
        self.postTableView.reloadData()
    }
    
    @objc func backBtnTapped() {
        self.dismiss(animated: false, completion: nil)
    }
    
    @objc func submitBtnTapped() {
        Config.isPosted = true
        self.view.window?.rootViewController?.dismiss(animated: false, completion: nil)
        Router.tabBarController.selectedIndex = 0
    }
}

extension PostVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.postArr.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.postTableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostCell
        
        cell.textName.text = self.postArr[indexPath.row]
        
        return cell
    }
}

class PostCell: UITableViewCell {
    var textName = UILabel()
    var toggle = UISwitch()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.contentView.backgroundColor = .white
        
        self.textName.font = UIFont.systemFont(ofSize: 16.0)
        
        self.contentView.addSubview(self.textName)
        self.contentView.addSubview(self.toggle)
        
        self.textName.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            (self.textName.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor)),
            (self.textName.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 20))
        ])
        
        self.toggle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            (self.toggle.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10)),
            (self.toggle.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -20)),
            (self.toggle.widthAnchor.constraint(equalToConstant: 50)),
            (self.toggle.heightAnchor.constraint(equalToConstant: 30))
        ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
