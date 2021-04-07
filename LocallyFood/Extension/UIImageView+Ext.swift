//
//  UIImageView+Ext.swift
//  LocallyFood
//
//  Created by Ahmet Acar on 7.04.2021.
//

import UIKit

extension UIImageView {
    func load(stringURL: String) {
        guard let url = URL(string: stringURL) else { return }
        if let data = try? Data(contentsOf: url) {
            if let image = UIImage(data: data) {
                    self.image = image
            } else {
                image = UIImage(named: LFImages.placeholder)
            }
        }
    }
}
