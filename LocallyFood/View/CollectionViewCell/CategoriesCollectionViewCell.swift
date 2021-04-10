//
//  CategoriesCollectionViewCell.swift
//  LocallyFood
//
//  Created by Ahmet Acar on 7.04.2021.
//

import UIKit
import SnapKit

class CategoriesCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier: String = "CategoriesCollectionViewCell"
    
    lazy var categoryImage = LFImageView()
    lazy var categoryLabel = LFLabel(fontSize:  16)
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(name: String, image: String) {
        categoryLabel.text = name
        categoryImage.load(stringURL: image)
    }
    
    func configure() {
        
        categoryLabel.textAlignment = .center
        backgroundColor = LFColors.largeCellColor
        layer.borderWidth = 2.0
        layer.borderColor = LFColors.cellBorderColor?.cgColor
        layer.masksToBounds = true
        layer.cornerRadius = 15.0
        
        contentView.addSubview(categoryImage)
        contentView.addSubview(categoryLabel)
        
        categoryImage.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(8)
            make.left.equalToSuperview().offset(8)
            make.right.equalToSuperview().offset(-8)
            make.height.equalToSuperview().multipliedBy(0.6)
        }
        
        categoryLabel.snp.makeConstraints { (make) in
            make.top.equalTo(categoryImage.snp.bottom).offset(4)
            make.left.equalToSuperview().offset(4)
            make.right.equalToSuperview().offset(4)
            make.bottom.equalToSuperview().offset(4)
        }
    }
}
