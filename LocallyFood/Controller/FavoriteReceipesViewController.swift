//
//  FavoriteReceipesViewController.swift
//  LocallyFood
//
//  Created by Ahmet Acar on 9.04.2021.
//

import UIKit

class FavoriteReceipesViewController: UIViewController {
    
    var favorites: [Meal] = []
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        getFavorites()
        configureNavigationController()
        //print(favorites)
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.backgroundColor = .systemBackground
        tableView.rowHeight = 90
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(FavoriteReceipesTableViewCell.self, forCellReuseIdentifier: FavoriteReceipesTableViewCell.reuseIdentifier)
    }
    
    private func configureNavigationController() {
        view.backgroundColor = .systemPink
        title = "Favorite Receipes"
    }
    
    private func getFavorites() {
        PersistenceManager.handleData { (result) in
            switch result {
            case .success(let favorite):
                self.favorites = favorite
            case .failure(let error):
                self.presentAlert(title: "Bad thing happened", message: error.rawValue)
            }
        }
    }
}

extension FavoriteReceipesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteReceipesTableViewCell.reuseIdentifier) as! FavoriteReceipesTableViewCell
        cell.set(food: favorites[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let destinationVC = FoodRecipeViewController()
        destinationVC.id = favorites[indexPath.row].id
        navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete Member") { (action, sourceView, completionHandler) in
            
            let favorite = self.favorites[indexPath.row]
            self.favorites.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
            
            PersistenceManager.updateWith(favorite: favorite, actionType: .remove) { error in
                guard let _ = error else { return }
                self.presentAlert(title: "Something Happened", message: "Unable to remove")
            }
            tableView.reloadData()
            completionHandler(true)
        }
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction])
        return swipeConfiguration
    }
}
