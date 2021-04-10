//
//  LFMealTitleLabel.swift
//  LocallyFood
//
//  Created by Ahmet Acar on 8.04.2021.
//

import UIKit

class LFMealTitleLabel: UILabel {

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(fontSize: CGFloat) {
        super.init(frame: .zero)
        font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
        configure()
    }
    
    private func configure() {
        text = "Missing value"
        textColor = LFColors.titleColor
        numberOfLines = 0
        textAlignment = .left
    }
}
