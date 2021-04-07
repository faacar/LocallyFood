//
//  UIHelper.swift
//  LocallyFood
//
//  Created by Ahmet Acar on 7.04.2021.
//

import UIKit

struct UIHelper {
    static func createCollectionViewFlowLayoutSize(numberOfItemsPerRow: CGFloat,
                                                   spacingBetweenCells: CGFloat,
                                                   height: CGFloat?,
                                                   collectionView: UICollectionView) -> CGSize {
        let totalSpacing = (2 * 8) + ((numberOfItemsPerRow - 1) * spacingBetweenCells)
        let width = (collectionView.bounds.width - totalSpacing)/numberOfItemsPerRow
        return CGSize(width: width, height: height ?? width)
    }
}
