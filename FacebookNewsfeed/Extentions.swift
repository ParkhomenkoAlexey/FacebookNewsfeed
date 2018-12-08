//
//  Extentions.swift
//  FacebookNewsfeed
//
//  Created by Алексей Пархоменко on 07/12/2018.
//  Copyright © 2018 Алексей Пархоменко. All rights reserved.
//

import Foundation
import UIKit

extension NewsfeedVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 400)
    }
}

