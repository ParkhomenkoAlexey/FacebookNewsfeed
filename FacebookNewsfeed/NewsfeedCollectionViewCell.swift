//
//  NewsfeedCollectionViewCell.swift
//  FacebookNewsfeed
//
//  Created by Алексей Пархоменко on 07/12/2018.
//  Copyright © 2018 Алексей Пархоменко. All rights reserved.
//

import UIKit

struct Identifier {
    static let newsfeedCell = "NewsfeedCell"
}

class NewsfeedCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI
    
    // private because we don't want anyone outside of this class being to access this property
    // and the reason for that is later on we are going to only allow anyone who uses this cell to be access
    // these properties via the model
    
    // lazy in Swift means that it is lazily loaded what means that if we just have like private var or just for profileImageView
    // or let profileImageView right variable and we just attack it will be created immediately at the time of the objects
    // are the instance initialization. If we have the lazy keyword here these properties would not be created at the time of the
    // initializer. It would be created  first time that property will be called
    
    private lazy var profileImageView: UIImageView! = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = #colorLiteral(red: 0.5686792731, green: 0.7940976024, blue: 0.9984217286, alpha: 1)
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "1")
        return imageView
    }()
    
    private lazy var usernameLabel: UILabel! = {
        let label = UILabel()
        label.numberOfLines = 3
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.text = "Alexey Parkhomenko"
        label.backgroundColor = UIColor.orange
        return label
    }()
    
    func setupUI() {
        self.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
        addSubview(usernameLabel)
        addSubview(profileImageView)
        
        // profileImageView and usernameLabel constraints
        // v0 - profileImageView
        // v1 - usernameLabel
        addConstraints(withVisualFormat: "H:|-8-[v0(44)]-8-[v1]-8-|", views: profileImageView, usernameLabel)
        addConstraints(withVisualFormat: "V:|-12-[v0]", views: usernameLabel)
        addConstraints(withVisualFormat: "V:|-12-[v0(44)]", views: profileImageView)
    }
}

private extension UIView {
    
    // set the size for elements in UICollectionViewCell
    // use auto layout constraints in code
    func addConstraints(withVisualFormat format: String, views: UIView...) {
        
        var viewsDictionary = [String:UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
            
        }
        let constraints = NSLayoutConstraint.constraints(withVisualFormat: format,
                                                         options: NSLayoutConstraint.FormatOptions(),
                                                         metrics: nil,
                                                         views: viewsDictionary)
        
        addConstraints(constraints)
    }
    
}
