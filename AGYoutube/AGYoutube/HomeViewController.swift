//
//  ViewController.swift
//  AGYoutube
//
//  Created by Andre on 5/3/17.
//  Copyright © 2017 Gulyi Andrii. All rights reserved.
//

import UIKit

class HomeViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "HOME"
        collectionView?.backgroundColor  = UIColor.white
        collectionView?.register(VideoCell.self, forCellWithReuseIdentifier: "cellID")
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

class  VideoCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    let userProfileImageView: UIImageView =  {
        let imageView = UIImageView()
        imageView.backgroundColor =  UIColor.green
        return imageView
    }()
    
    let thumbnailImageView: UIImageView =  {
        let imageView = UIImageView()
        imageView.backgroundColor =  UIColor.blue
        return imageView
    }()
    
    let separatorView: UIView =  {
        let view = UIView()
        view.backgroundColor = UIColor.black
        return view
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(thumbnailImageView)
        addSubview(separatorView)
        

        addConsraintsWithFormat(format: "H:|-16-[v0]-16-|", views: thumbnailImageView)
        addConsraintsWithFormat(format: "H:|-16-[v0(44)]|", views: userProfileImageView)
        
        //vertical constraints
        addConsraintsWithFormat(format: "V:|-16-[v0]-8-[v1(44)]-16-[v2(1)]|", views: thumbnailImageView,userProfileImageView, separatorView)
        
        addConsraintsWithFormat(format: "H:|[v0]|", views: separatorView)
        
    }
}

extension UIView {
    func addConsraintsWithFormat(format: String, views: UIView...){
        
        var viewsDictionary = [String: UIView] ()
        
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] =  view
        }
        
                addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
}
