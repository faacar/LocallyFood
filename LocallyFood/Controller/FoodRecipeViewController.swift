//
//  FoodReceipeViewController.swift
//  LocallyFood
//
//  Created by Ahmet Acar on 7.04.2021.
//

import UIKit
import SnapKit

class FoodRecipeViewController: UIViewController {
    
    var id: String!
    var mealInfo: Meal?

    private lazy var mealImage = LFImageView()
    private lazy var mealNameLabel = LFMealTitleLabel(fontSize: 17)
    private lazy var mealCategoryLabel = LFMealTitleLabel(fontSize: 17)
    private lazy var mealDescriptionTitleLabel = LFMealTitleLabel(fontSize: 17)
    private lazy var mealDescriptionLabel = LFLabel(fontSize: 15)
    
    private lazy var stackView = UIStackView(arrangedSubviews: [mealNameLabel, mealCategoryLabel, mealDescriptionTitleLabel])
    private lazy var contentView = UIView()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()

    
    override func viewDidLoad() {
        view.backgroundColor = .systemBackground
        scrollView.backgroundColor = .systemBackground
        contentView.backgroundColor = .systemBackground
        
        addSubView()
        networkCall()
        configure()
        configureStackView()
        configureNavigationController()
    }
    
//MARK: - Methods
    
    private func addSubView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(mealImage)
        contentView.addSubview(stackView)
        contentView.addSubview(mealDescriptionLabel)
    }
    
    private func setInfo() {
        title = mealInfo?.name
        mealNameLabel.text = mealInfo?.name
        mealCategoryLabel.text = mealInfo?.category
        mealDescriptionLabel.text = mealInfo?.instructions
        mealDescriptionTitleLabel.text = "Description:"
        
        if ((mealInfo?.thumbnail) != nil) {
            mealImage.load(stringURL: mealInfo!.thumbnail)
        }
    }
    
    private func configureStackView() {
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 4
    }
    
    private func configureNavigationController() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(favoriteButtonTapped ))
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.rightBarButtonItem = addButton
    }
    
//MARK: - Setup UI

    private func configure() {
        mealDescriptionLabel.textColor = LFColors.labelColor
        
        mealImage.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(12)
            make.right.equalToSuperview().offset(-12)
            make.top.equalToSuperview().offset(12)
            make.height.equalTo(view.snp.height).multipliedBy(0.35)
        }
        stackView.snp.makeConstraints { (make) in
            make.top.equalTo(mealImage.snp.bottom).offset(8)
            make.left.equalToSuperview().offset(12)
            make.right.equalToSuperview().offset(-12)
            make.height.equalTo(view.snp.height).multipliedBy(0.15)
        }
        mealDescriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(stackView.snp.bottom)
            make.left.equalTo(contentView.snp.left).offset(12)
            make.right.equalTo(contentView.snp.right).offset(-12)
            make.bottom.equalTo(contentView.snp.bottom)
        }
        scrollView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide)

        }
        contentView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
//MARK: - NetworkCall
    
    private func networkCall() {
        showLoadingView()
        NetworkManager.shared.getReceipe(id: self.id) { (result) in
            self.dismissLoadingView()
            switch result {
            case .success(let data):
                //print(data)
                DispatchQueue.main.async {
                    self.mealInfo = data[0]
                    self.setInfo()
                }
            case .failure(_):
                print("Error")
            }
        }
    }
    
//MARK: - Button Actions
    
    @objc func favoriteButtonTapped() {
        print("favorite button tapped")
        PersistenceManager.updateWith(favorite: mealInfo!, actionType: .add) { (error) in
            guard let _ = error else {
                self.presentAlert(title: "Success!", message: "You made it")
                return
            }
            self.presentAlert(title: "You did it again!", message: "You've already added this to your favorites")
        }

        
    }
}
