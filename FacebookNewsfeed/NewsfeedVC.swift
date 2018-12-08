//
//  NewsfeedVC.swift
//  FacebookNewsfeed
//
//  Created by Алексей Пархоменко on 07/12/2018.
//  Copyright © 2018 Алексей Пархоменко. All rights reserved.
//

import UIKit


class NewsfeedVC: UICollectionViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = #colorLiteral(red: 0.8640883565, green: 0.9178858399, blue: 0.9996795058, alpha: 1)
        title = "Newsfeed"
        
        // register the cell
        collectionView.register(NewsfeedCollectionViewCell.self, forCellWithReuseIdentifier: Identifier.newsfeedCell)

    }
    
    // MARK: - UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifier.newsfeedCell, for: indexPath) as! NewsfeedCollectionViewCell
        return cell
    }
    
}


