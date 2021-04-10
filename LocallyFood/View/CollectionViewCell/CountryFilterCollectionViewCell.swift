//
//  CountryFilterCollectionViewCell.swift
//  LocallyFood
//
//  Created by Ahmet Acar on 7.04.2021.
//

import UIKit
import SnapKit

class CountryFilterCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier: String = "CountryFilterCollectionViewCell"
    
    private lazy var countryLabel = LFLabel(fontSize: 15)
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(buttonTitle: String) {
        //countryButton.setTitle(buttonTitle, for: .normal)
        countryLabel.text = buttonTitle
    }
    
    func configure() {
        contentView.addSubview(countryLabel)
        backgroundColor = LFColors.smallCellColor
        layer.masksToBounds = true
        layer.cornerRadius = 15.0
        
        countryLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.centerY.equalTo(self)
        }
    }
}
