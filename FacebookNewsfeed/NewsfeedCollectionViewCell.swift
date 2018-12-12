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
    
    // MARK: - Model
    
    var post: Post! {
        didSet {
            guard let username = post.createdBy.username,
                let profileImage = post.createdBy.profileImage,
                let caption = post.caption,
                let postImage = post.image,
                let numberOfLikes = post.numberOfLikes,
                let numberOfComments = post.numberOfComments,
                let numberOfShares = post.numberOfShares else {
                    return
                    
            }
            
            // set values to our UI element
            usernameLabel.text = username
            profileImageView.image = profileImage
            
            captionTextView.text = caption
            postImageView.image = postImage
            
            let likeStat = (numberOfLikes == 0) ? "" : "\(numberOfLikes) Likes     "
            let commentStat = (numberOfComments == 0) ? "" : "\(numberOfComments) Comments     "
            let shareStat = (numberOfShares == 0) ? "" : "\(numberOfShares) Shares"
            postStatLabel.text = likeStat + commentStat + shareStat
        }
    }
    // socialize your apps
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI
    
//     private because we don't want anyone outside of this class being to access this property
//     and the reason for that is later on we are going to only allow anyone who uses this cell to be access
//     these properties via the model
//
//     lazy in Swift means that it is lazily loaded what means that if we just have like private var or just for profileImageView
//     or let profileImageView right variable and we just attack it will be created immediately at the time of the objects
//     are the instance initialization. If we have the lazy keyword here these properties would not be created at the time of the
//     initializer. It would be created  first time that property will be called
    
    private lazy var profileImageView: UIImageView! = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "1")
        return imageView
    }()
    
    private lazy var usernameLabel: UILabel! = {
        let label = UILabel()
        //label.numberOfLines = 1
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.text = "Alexey Parkhomenko"
        return label
    }()
    
    private lazy var captionTextView: UITextView! = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.isSelectable = false
        return textView
    }()
    
    private lazy var postImageView: UIImageView! = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true // image do not go outside its bounds
        return imageView
    }()
    
    private lazy var postStatLabel: UILabel! = {
       let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        label.textColor = .darkGray
        label.text = "12 Likes     8 Comments     2 Shares"
        return label
    }()
    
    private lazy var timeAgoLabel: UILabel! = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        label.textColor = UIColor.lightGray
        label.text = "Now"
        return label
    
    }()
    
    private lazy var privacyImageView: UIImageView! = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "icon-globe")
        return imageView
    }()
    
    // size of this view we will make using auto layout constraints
    private lazy var postDividerView: UIView! = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 226/255.0, green: 228/255.0, blue: 232/255.0, alpha: 1)
        return view
    }()
    
    private lazy var likeButton: UIButton! = NewsfeedCollectionViewCell.buttonWithTitle("Like", imageName: "icon-like")
    private lazy var commentButton: UIButton! = NewsfeedCollectionViewCell.buttonWithTitle("Comment", imageName: "icon-comment")
    private lazy var shareButton: UIButton! = NewsfeedCollectionViewCell.buttonWithTitle("Share", imageName: "icon-share")
    
    // class keyword here means that this function belongs to the class we can call without initializing an instance
    private class func buttonWithTitle(_ title: String, imageName: String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(UIColor(red: 143/255, green: 150/255, blue: 163/255, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setImage(UIImage(named: imageName), for: .normal)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
        return button
    }
    
    
    func setupUI(frame: CGRect) {
        self.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        addSubview(usernameLabel)
        addSubview(profileImageView)
        addSubview(timeAgoLabel)
        addSubview(privacyImageView)
        addSubview(captionTextView)
        addSubview(postImageView)
        addSubview(postStatLabel)
        addSubview(postDividerView)
        addSubview(likeButton)
        addSubview(commentButton)
        addSubview(shareButton)
        
        
        // profileImageView and usernameLabel constraints
        addConstraints(withVisualFormat: "H:|-8-[v0(44)]-8-[v1]-8-|", views: profileImageView, usernameLabel)
        addConstraints(withVisualFormat: "V:|-8-[v0]", views: usernameLabel)
        
        //constraints for timeAgoLabel + privacyImageView
        addConstraints(withVisualFormat: "H:[v0]-8-[v1]-4-[v2(10)]", views: profileImageView, timeAgoLabel, privacyImageView)
        addConstraints(withVisualFormat: "V:[v0]-4-[v1]", views: usernameLabel, timeAgoLabel)
        addConstraints(withVisualFormat: "V:[v0]-6-[v1(10)]", views: usernameLabel, privacyImageView)
        
        // constraints for the captionTextView
        addConstraints(withVisualFormat: "H:|[v0]|", views: captionTextView)
        
        // constraints for the postImageView
        addConstraints(withVisualFormat: "H:|[v0]|", views: postImageView)
        
        // constraints for the postStatLabel
        addConstraints(withVisualFormat: "H:|-8-[v0]-8-|", views: postStatLabel)
        
        // constraints for the postDividerView
        addConstraints(withVisualFormat: "H:|-8-[v0]-8-|", views: postDividerView)
        
        // constraints for the buttons
        addConstraints(withVisualFormat: "H:|[v0(v2)][v1(v2)][v2]|", views: likeButton, commentButton, shareButton)
        addConstraints(withVisualFormat: "V:[v0(44)]|", views: commentButton)
        addConstraints(withVisualFormat: "V:[v0(44)]|", views: shareButton)
        
        // constraints vertical
        
        addConstraints(withVisualFormat: "V:|-8-[v0(44)]-4-[v1][v2]-8-[v3(24)]-8-[v4(0.4)][v5(44)]|", views: profileImageView, captionTextView, postImageView, postStatLabel, postDividerView, likeButton)

    }
}


