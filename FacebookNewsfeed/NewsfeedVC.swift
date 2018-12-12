//
//  NewsfeedVC.swift
//  FacebookNewsfeed
//
//  Created by Алексей Пархоменко on 07/12/2018.
//  Copyright © 2018 Алексей Пархоменко. All rights reserved.
//

import UIKit


class NewsfeedVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    
    var posts : [Post] = Post.fetchPosts()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = #colorLiteral(red: 0.8640883565, green: 0.9178858399, blue: 0.9996795058, alpha: 1)
        title = "Newsfeed"
        collectionView.alwaysBounceVertical = true
        // register the cell
        collectionView.register(NewsfeedCollectionViewCell.self, forCellWithReuseIdentifier: Identifier.newsfeedCell)
        

    }
    
    // MARK: - UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifier.newsfeedCell, for: indexPath) as! NewsfeedCollectionViewCell
        cell.post = self.posts[indexPath.item]
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let captionText = posts[indexPath.row].caption
        let postImage = posts[indexPath.row].image
        let knownHeight: CGFloat = 8 + 44 + 4 + 8 + 24 + 8 + 0.4 + 44
        
        let textHeight = getCaptionTextHeight(text: captionText!)
        let imageHeight = getPostImageHeight(image: postImage!)
        return CGSize(width: view.frame.width, height: textHeight + knownHeight + imageHeight + 18)
        

    }
    
    // MARK: Functions
    
    // dymanic change captionTextView size
    func getCaptionTextHeight(text: String) -> CGFloat {
        let rect = NSString(string: text).boundingRect(with: CGSize(width: view.frame.width, height: 2000),
                                                       options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin),
                                                       attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)],
                                                       context: nil)
        return rect.height
    }
    
    // dymanic change postImageView size
    func getPostImageHeight(image: UIImage) -> CGFloat {
        let imageCrop = image.getCropRatio()
        let postImageHeigh = view.frame.width / imageCrop
        return postImageHeigh
    }
    
} // class


