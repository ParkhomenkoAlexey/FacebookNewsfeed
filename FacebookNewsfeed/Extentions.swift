//
//  Extentions.swift
//  FacebookNewsfeed
//
//  Created by Алексей Пархоменко on 07/12/2018.
//  Copyright © 2018 Алексей Пархоменко. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
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

extension UIImage {
    func getCropRatio() -> CGFloat {
        let widthRatio = CGFloat(self.size.width / self.size.height)
        return widthRatio
    }
}
