//
//  HomeVC.swift
//  Instagram-UIClone
//
//  Created by umut yalçın on 27.10.2023.
//

import UIKit

class HomeVC: UIViewController {

    private let logo = UIImage(named: "logo")?.withTintColor(.systemBackground)
    private let heart = UIImage(named: "heart")?.withTintColor(.systemBackground)
    private let message = UIImage(named: "message")?.withTintColor(.systemBackground)
    
    override func loadView() {
        let homeView = HomeView()
        view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureNavBar()
    }
    
    private func configureNavBar(){
            
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: logo, style: .plain, target: self, action: nil)

        self.navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: message, style: .done, target: self, action: nil),
            UIBarButtonItem(image: heart, style: .done, target: self, action: nil),
        ]
        navigationController?.navigationBar.tintColor = .label
            
    }
}


#Preview {
    HomeVC()
}
