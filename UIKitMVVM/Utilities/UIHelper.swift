//
//  UIHelper.swift
//  UIKitMVVM
//
//  Created by İbrahim Aktaş on 13.02.2024.
//

import UIKit

enum UIHelper {
    static func createHomeFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        
        let itemWidth = CGFloat.dWidth
        
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth * 1.5)
        layout.minimumLineSpacing = 40
        
        return layout
    }
}
