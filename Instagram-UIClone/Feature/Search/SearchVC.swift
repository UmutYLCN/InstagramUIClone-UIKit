//
//  SearchVC.swift
//  Instagram-UIClone
//
//  Created by umut yalçın on 30.10.2023.
//

import UIKit

class SearchVC: UIViewController {
    
    private lazy var searchBar : UISearchController = {
        var sb = UISearchController()
        sb.searchBar.placeholder = "Search"
        sb.searchBar.searchBarStyle = .minimal
        sb = UISearchController(searchResultsController: SearchResultVC())
      return sb
    }()
    
    override func loadView() {
        super.loadView()
        let searchView = SearchView()
        view = searchView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        view.backgroundColor = .systemBackground
    }
    
    
    func configure(){
        navigationItem.searchController = searchBar
        searchBar.searchResultsUpdater = self
    }

}


extension SearchVC : UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        guard let query = searchBar.text,!query.trimmingCharacters(in: .whitespaces).isEmpty,
                     query.trimmingCharacters(in: .whitespaces).count >= 3,
              let _ = searchController.searchResultsController as? SearchResultVC else {
                         return
        }
               

    }
}
