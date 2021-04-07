//
//  HomePageViewController.swift
//  LocallyFood
//
//  Created by Ahmet Acar on 7.04.2021.
//

import UIKit
import SnapKit

class HomePageViewController: UIViewController{
    var countries: [Country] = []
    var categories: [Category] = []
    
    private lazy var filterCountryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(CountryFilterCollectionViewCell.self, forCellWithReuseIdentifier: CountryFilterCollectionViewCell.reuseIdentifier)
        return cv
    }()
    
    private lazy var categoriesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(CategoriesCollectionViewCell.self, forCellWithReuseIdentifier: CategoriesCollectionViewCell.reuseIdentifier)
        return cv
    }()
    
    override func viewDidLoad() {
        title = "Home Page"
        view.backgroundColor = .systemBackground
        configureFilterCountryCollectionView()
        configureCategoriesCollectionView()
    }
    

    
    private func configureFilterCountryCollectionView() {
        view.addSubview(filterCountryCollectionView)
        filterCountryCollectionView.backgroundColor = .systemBackground
        filterCountryCollectionView.delegate = self
        filterCountryCollectionView.dataSource = self
        
        filterCountryCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.equalToSuperview().offset(8)
            make.right.equalToSuperview().offset(-8)
            make.height.equalToSuperview().multipliedBy(0.08)
        }
        DispatchQueue.main.async {
            NetworkManager.shared.getCountries { (result) in
                switch result {
                case .success(let data):
                    self.countries = data
                    self.filterCountryCollectionView.reloadData()
                case .failure(_):
                    print("error") // TODO: Handle the error
                }
            }
        }

    }
    
    private func configureCategoriesCollectionView() {
        view.addSubview(categoriesCollectionView)
        categoriesCollectionView.backgroundColor = .systemBackground
        categoriesCollectionView.delegate = self
        categoriesCollectionView.dataSource = self
        
        categoriesCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(filterCountryCollectionView.snp.bottom)
            make.left.equalToSuperview().offset(8)
            make.right.equalToSuperview().offset(-8)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        NetworkManager.shared.getCategories { (result) in
            switch result {
            case .success(let data):
                self.categories = data
                self.categoriesCollectionView.reloadData()

            case .failure(_):
                print("error")
            }
        }
    }
}

extension HomePageViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.filterCountryCollectionView {
            return CGSize(width: collectionView.frame.width/2.4, height: collectionView.frame.height/1.4)
        } else {
            let numberOfItemsPerRow:CGFloat = 3
            let spacingBetweenCells:CGFloat = 8
            
            let totalSpacing = (2 * 8) + ((numberOfItemsPerRow - 1) * spacingBetweenCells)
            let width = (categoriesCollectionView.bounds.width - totalSpacing)/numberOfItemsPerRow
            return CGSize(width: width, height: width)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.filterCountryCollectionView {
            return countries.count
        } else {
            return categories.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.filterCountryCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CountryFilterCollectionViewCell.reuseIdentifier, for: indexPath) as! CountryFilterCollectionViewCell
            cell.set(buttonTitle: countries[indexPath.row].countryName)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesCollectionViewCell.reuseIdentifier, for: indexPath) as! CategoriesCollectionViewCell
            cell.set(name: categories[indexPath.row].name, image: categories[indexPath.row].thumbnail)
            return cell
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("clicked")
    }
    
    
}
