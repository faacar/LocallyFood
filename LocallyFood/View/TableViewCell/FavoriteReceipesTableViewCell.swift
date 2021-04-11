//
//  FavoriteReceipesTableViewCell.swift
//  LocallyFood
//
//  Created by Ahmet Acar on 9.04.2021.
//

import UIKit
import SnapKit

class FavoriteReceipesTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "FavoriteReceipesTableViewCell"
    let foodImage = LFImageView()
    let foodNameLabel = LFMealTitleLabel(fontSize: 16)
    let foodCategoryLabel = LFLabel(fontSize: 15)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(food: Meal) {
        foodImage.load(stringURL: food.thumbnail)
        foodNameLabel.text = food.name
        foodCategoryLabel.text = food.category
    }
    
    private func configure() {
        addSubview(foodImage)
        addSubview(foodNameLabel)
        contentView.addSubview(foodCategoryLabel)
        backgroundColor = LFColors.largeCellColor
        accessoryType = .disclosureIndicator

        foodImage.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(8)
            make.centerY.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.2)
            make.height.equalToSuperview().multipliedBy(0.8)
        }

        foodNameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(foodImage.snp.right).offset(4)
            make.right.equalToSuperview().offset(-8)
            make.top.equalTo(foodImage.snp.top)
            make.height.equalTo(foodImage.snp.height).multipliedBy(0.45)
        }

        foodCategoryLabel.snp.makeConstraints { (make) in
            make.left.equalTo(foodImage.snp.right).offset(4)
            make.right.equalToSuperview().offset(-8)
            make.bottom.equalTo(foodImage.snp.bottom)
            make.height.equalTo(foodImage.snp.height).multipliedBy(0.45)
        }
    }
}
