//
//  SearchResultVC.swift
//  Instagram-UIClone
//
//  Created by umut yalçın on 31.10.2023.
//

import UIKit

class SearchResultVC: UIViewController {

    override func loadView() {
        super.loadView()
        let SearchResultview = SearchResultView()
        view = SearchResultview
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }
}
