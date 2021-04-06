//
//  VC2.swift
//  LocallyFood
//
//  Created by Ahmet Acar on 7.04.2021.
//

import UIKit


class VC2: UIViewController{
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        //fetchFilms()
        NetworkManager.shared.getCountries()
        //NetworkManager.shared.getLists(type: "a", info: "Canadian")
        //NetworkManager.shared.getCategories()
        //NetworkManager.shared.getReceipe(id: "52767")


    }
}



