//
//  CategoryListViewController.swift
//  LocallyFood
//
//  Created by Ahmet Acar on 7.04.2021.
//

import UIKit

class CategoryListViewController: UIViewController {
    
    var foodLists: [List] = []
    var type = ""
    var info = ""
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(CategoryListCollectionViewCell.self, forCellWithReuseIdentifier: CategoryListCollectionViewCell.reuseIdentifier)
        return cv
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = .systemBackground
        title = info
        collectionView.delegate = self
        collectionView.dataSource = self
        configureCollectionView()
    }
    
    
    private func configureCollectionView() {
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.bottom.equalToSuperview()
        }
        
        
        DispatchQueue.main.async {
            NetworkManager.shared.getLists(type: self.type, info: self.info) { (result) in
                switch result {
                case .success(let data):
                    self.foodLists = data
                    self.collectionView.reloadData()
                case .failure(_):
                    print("Error")
                }
            }
        }
    }
    
    
    
}

extension CategoryListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        foodLists.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryListCollectionViewCell.reuseIdentifier, for: indexPath) as! CategoryListCollectionViewCell
        cell.set(name: foodLists[indexPath.row].name, image: foodLists[indexPath.row].thumbnail)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = UIHelper.createCollectionViewFlowLayoutSize(numberOfItemsPerRow: 2,
                                                               spacingBetweenCells: 4,
                                                               height: view.frame.height / 4,
                                                               collectionView: collectionView)
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let destinationVC = FoodReceipeViewController() // ProductDetail
        navigationController?.pushViewController(destinationVC, animated: true)
        
    }
    
    
}
