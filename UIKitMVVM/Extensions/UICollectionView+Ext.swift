//
//  UICollectionView+Ext.swift
//  UIKitMVVM
//
//  Created by İbrahim Aktaş on 14.02.2024.
//

import UIKit

extension UICollectionView {
    func reloadOnMainThread() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
}

