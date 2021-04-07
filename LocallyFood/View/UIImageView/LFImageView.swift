//
//  LFImageView.swift
//  LocallyFood
//
//  Created by Ahmet Acar on 7.04.2021.
//

import UIKit

class LFImageView: UIImageView {

    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        image = UIImage(named: LFImages.placeholder)!
        clipsToBounds = true
        layer.cornerRadius = 10
        layer.borderWidth = 2.0
        layer.borderColor = LFColors.cellBorderColor?.cgColor
        sizeToFit()
    }
}

