//
//  CategoryListCollectionViewCell.swift
//  LocallyFood
//
//  Created by Ahmet Acar on 7.04.2021.
//

import UIKit
import SnapKit

class CategoryListCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier: String = "CategoryListViewController"
    
    lazy var catergoryImage = LFImageView()
    lazy var catergoryLabel = LFLabel(fontSize: 16)
    lazy var isFavoriteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: LFImages.star), for: .normal)
        button.addTarget(self, action: #selector(favoriteButtonClicked), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(name: String, image: String) {
        catergoryLabel.text = name
        catergoryImage.load(stringURL: image)
    }
    
    func configure() {
        
        catergoryLabel.textAlignment = .center
        
        layer.borderWidth = 2.0
        layer.borderColor = LFColors.cellBorderColor?.cgColor
        layer.masksToBounds = true
        layer.cornerRadius = 15.0
        

        contentView.addSubview(catergoryImage)
        contentView.addSubview(catergoryLabel)
        contentView.addSubview(isFavoriteButton)
        
        isFavoriteButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(5)
            make.right.equalToSuperview().offset(-5)
            make.height.equalToSuperview().multipliedBy(0.16)
            make.width.equalTo(isFavoriteButton.snp.height)
        }
        
        catergoryImage.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(24)
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(-24)
            make.height.equalToSuperview().multipliedBy(0.6)
        }
        
        catergoryLabel.snp.makeConstraints { (make) in
            make.top.equalTo(catergoryImage.snp.bottom).offset(4)
            make.left.equalToSuperview().offset(4)
            make.right.equalToSuperview().offset(4)
            make.bottom.equalToSuperview().offset(4)
        }
    }
    
    @objc func favoriteButtonClicked() {
        print("favorites button clicked")
    }
    
}
