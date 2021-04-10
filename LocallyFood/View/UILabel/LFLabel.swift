//
//  LFLabel.swift
//  LocallyFood
//
//  Created by Ahmet Acar on 7.04.2021.
//

import UIKit

class LFLabel: UILabel {

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(fontSize: CGFloat) {
        super.init(frame: .zero)
        font = font.withSize(fontSize)
        configure()
    }
    
    private func configure() {
        text = "Missing value"
        textColor = .label
        numberOfLines = 0
        textAlignment = .left
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.9
        lineBreakMode = .byTruncatingTail
    }
}
