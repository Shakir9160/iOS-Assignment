//
//  GalleryVC.swift
//  iOS Assignment
//
//  Created by Shaik Shakir on 02/06/20.
//  Copyright © 2020 Shakir. All rights reserved.
//

import UIKit
import Photos

class GalleryVC: UIViewController {
    
    var selectedImage = UIImageView()
    var galleryCollectionView: UICollectionView!
    var cellId = "photoCell"
    
    var allPhotos = PHFetchResult<PHAsset>()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.setupView()
    }
    
    func setupView() {
        self.setUpNavigationBar()
        self.view.backgroundColor = UIColor.white
        
        // Load Photos
        PHPhotoLibrary.requestAuthorization { (status) in
            switch status {
                
            case .authorized:
                let fetchOptions = PHFetchOptions()
                self.allPhotos = PHAsset.fetchAssets(with: .image, options: fetchOptions)
                print("Good to proceed")
                print("Found number of: \(self.allPhotos.count) images")
                
            case .denied, .restricted:
                print("Not allowed")
                
            case .notDetermined:
                print("Not determined yet")
                
            @unknown default:
                print("Error")
            }
        }
        
        self.selectedImage = UIImageView(frame: CGRect(x: self.view.frame.origin.x, y: (self.navigationController?.navigationBar.frame.size.height ?? 0), width: self.view.frame.size.width, height: 300))
        self.view.addSubview(self.selectedImage)
        
        self.selectedImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            (self.selectedImage.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0)),
            (self.selectedImage.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0)),
            (self.selectedImage.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0)),
            (self.selectedImage.heightAnchor.constraint(equalToConstant: 300))
        ])
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (self.view.frame.size.width - 6)/4, height: 100)

        self.galleryCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        self.galleryCollectionView.dataSource = self
        self.galleryCollectionView.delegate = self
        self.galleryCollectionView.register(GalleryCell.self, forCellWithReuseIdentifier: cellId)
        self.galleryCollectionView.showsVerticalScrollIndicator = false
        self.galleryCollectionView.backgroundColor = UIColor.white
        self.galleryCollectionView.bounces = false
        self.view.addSubview(self.galleryCollectionView)
        
        self.galleryCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            (self.galleryCollectionView.topAnchor.constraint(equalTo: self.selectedImage.bottomAnchor, constant: 2)),
            (self.galleryCollectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0)),
            (self.galleryCollectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0)),
            (self.galleryCollectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0))
        ])
        self.galleryCollectionView.reloadData()
    }
        
    func setUpNavigationBar() {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.title = "Gallery"
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "close")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(self.closeButtonTapped))
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(self.nextBtnTapped))
    }
    
    @objc func closeButtonTapped() {
        self.dismiss(animated: false, completion: nil)
        Router.tabBarController.selectedIndex = Config.index
    }
    
    @objc func nextBtnTapped() {
        let postVC = UINavigationController(rootViewController: PostVC())
        Config.selectedImage = self.selectedImage
        postVC.modalPresentationStyle = .fullScreen
        self.present(postVC, animated: false, completion: nil)
    }
}

extension GalleryVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.allPhotos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.galleryCollectionView.frame.size.width - 6)/4, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.galleryCollectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! GalleryCell

        let asset = allPhotos.object(at: indexPath.item)
        cell.imgPicture.fetchImage(asset: asset, contentMode: .aspectFit, targetSize: (cell.frame.size))
        self.selectedImage.fetchImage(asset: (self.allPhotos.object(at: Config.imgIndex)), contentMode: .aspectFit, targetSize: (self.selectedImage.frame.size))

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let asset = allPhotos.object(at: indexPath.item)
        self.selectedImage.fetchImage(asset: asset, contentMode: .aspectFit, targetSize: (self.selectedImage.frame.size))
        Config.imgIndex = indexPath.item
    }
}

extension UIImageView {
    func fetchImage(asset: PHAsset, contentMode: PHImageContentMode, targetSize: CGSize) {
        let manager = PHImageManager.default()
        
        let options = PHImageRequestOptions()
        options.deliveryMode = PHImageRequestOptionsDeliveryMode.highQualityFormat
        options.isSynchronous = true
        options.isNetworkAccessAllowed = true
        options.version = .original
        
        manager.requestImage(for: asset, targetSize: targetSize, contentMode: contentMode, options: options) { image, _ in
            if image != nil {
                guard let image = image else { return }
                switch contentMode {
                case .aspectFill:
                    self.contentMode = .scaleAspectFill
                case .aspectFit:
                    self.contentMode = .scaleToFill
                @unknown default:
                    print("Error")
                }
                self.image = image
            }
            else {
                print("error asset to image")
            }
        }
    }
}

class GalleryCell: UICollectionViewCell {
    var imgPicture = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.addSubview(imgPicture)
        self.imgPictureConstraint()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func imgPictureConstraint() {
        self.imgPicture.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            (self.imgPicture.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0)),
            (self.imgPicture.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 0)),
            (self.imgPicture.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: 0)),
            (self.imgPicture.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0))
        ])
    }
}
